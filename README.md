# Laboratorio semana 5: Optimización

En este laboratorio se perfilará, analizará y optimizará el código de un colimador que alinea 2 rieles o perfiles H. Este código usa centroides (centros de masa) para calcular distancias, se usan 2 perfiles, uno de referencia y otro de estado actual, el centroide de referencia nunca se mueve, pero el de estado actual es el que se usa para medir desplazamientos y distancias. Esta distancia por medio de traslaciones, rotaciones y transformaciones, siempre comparando y recalculado, cada iteración para acercarse a la alineación de los rieles. Para hacer estas comparaciones y mediciones se usan varios medidores, pero 3 son de interés: *match_rsme*, *symmetric_chamfer_rmse*, *profile_score*:
* match_rmse: RMSE calculado solo sobre los emparejamientos usados para estimar la transformación de esa iteración. Es una medida "interna" del ajuste local usado para la optimización, dice qué tan bien va cada iteración, qué tanto "match" hace entre los rieles.
* symmetric_chamfer_rmse: ombina las distancias vecino-más-cercano en ambas direcciones sobre toda la nube Es una medida más completa de qué tan bien coinciden los dos perfiles como conjuntos.
* profile_score: Es la que se usa como criterio de convergencia global. Combina el ajuste de forma (chamfer) con el ajuste de posición global (centroides), normalizado por el tamaño del canvas para que sea adimensional/comparable.

Otro dato a analizar son las transformaciones que genera el sistema a los rieles y por qué la transformación no rígida impide recuperar exactamente al transformación ideal. La transformación "ideal" es una rotación + traslación pura, generada con transform_about_canvas_center. Pero antes de correr el ICP, main le aplica a source dos cosas adicionales:

add_random_deformation: desplaza cada punto con una combinación de ondas senoidales globales y bultos direcciones aleatorias, esto es una deformación no rígida, es decir, distinta para cada punto según su posición, no una rotación/traslación uniforme.
Estimate_rigid_transform solo puede modelar transformaciones rígidas. Como la nube fuente real ya no es una copia rígida exacta del target, no existe ninguna rotación+traslación única que mapee todos los puntos deformados exactamente sobre el target. El algoritmo encuentra la mejor rotación/traslación en promedio sobre los emparejamientos, pero cada iteración empareja puntos por vecino-más-cercano, y esos emparejamientos ya están contaminados por el desplazamiento no uniforme de la deformación.
El resultado converge, pero nunca es perfecto porque la deformación real no es representable por el modelo rígido.

## Perfilado del código

El código se perfilará con 3 herramientas: *perf*, *valgrind/callgrind* y *google-perf/pprof*.

### Perfilado con *perf*
Se correrá el código en una laptop con 13th Gen i5-1334U, con 16 GiB de RAM en Arch Linux, kernel Linux 7.1.8-arch1-3. El perfilado de *perf* comienza con mediciones generales del código de colimado, corriendo:

perf stat ./point_cloud_collimation

perf stat ./point_cloud_collimation --export

El último resulta en una base de datos que resultará útil cuando queramos visualizar los datos en una consola para análisis, que se verán pronto. Por ahora, se presentan los datos generales del perfilado:

| Métrica | Sin --export | Con --export | Notas |
|---|---|---|---|
| **Tiempo total (elapsed)** | 23,801284946 s | 25,355368522 s | Wall-clock |
| Tiempo de usuario (user) | 23,612971000 s | 24,769529000 s | CPU en modo usuario |
| Tiempo de sistema (sys) | 0,063680000 s | 0,184357000 s | CPU en modo kernel (I/O al exportar) |
| Task-clock | 23 785,57 ms | 25 338,83 ms | Tiempo de CPU consumido |
| **Instrucciones (cpu_core)** | 210 387 090 017 | 238 232 632 909 | IPC: 2,1 → 2,3 |
| **Instrucciones (cpu_atom)** | 86 572 168 762 | 112 142 567 721 | IPC: 1,5 → 2,3 |
| **Ciclos de CPU (cpu_core)** | 99 225 751 791 | 105 803 026 725 | Frecuencia efectiva ≈ 4,2 GHz en ambos |
| **Ciclos de CPU (cpu_atom)** | 56 750 583 946 | 48 091 818 421 | Frecuencia efectiva: 2,4 GHz → 1,9 GHz |
| **Branches (cpu_core)** | 27 872 382 345 | 33 385 151 226 | ≈ 1171,8 → 1317,5 M/seg |
| **Branches (cpu_atom)** | 11 738 734 454 | 18 863 638 386 | ≈ 493,5 → 744,5 M/seg |
| **Branch misses (cpu_core)** | 528 044 090 | 543 871 162 | Tasa: 1,9 % → 1,6 % |
| **Branch misses (cpu_atom)** | 278 302 259 | 151 237 758 | Tasa: 2,4 % → 0,8 % |
| Context switches | 0 | 0 | Sin cambios de contexto involuntarios |
| CPU migrations | 0 | 0 | Sin migración entre núcleos |
| Page faults | 43 001 | 36 365 | ≈ 1807,9 → 1435,1 fallos/seg |
| Bad speculation (cpu_core) | 17,6 % | 18,2 % | Topdown L1 |
| Frontend bound (cpu_core) | 12,2 % | 12,5 % | Topdown L1 |
| Backend bound (cpu_core) | 39,4 % | 37,5 % | Topdown L1 — cuello de botella dominante en ambos |
| Retiring (cpu_core) | 30,9 % | 31,8 % | Topdown L1 |
| Bad speculation (cpu_atom) | 17,2 % | 11,8 % | Topdown L1 |
| Frontend bound (cpu_atom) | 21,4 % | 17,4 % | Topdown L1 |
| Backend bound (cpu_atom) | 29,9 % | 21,5 % | Topdown L1 |
| Retiring (cpu_atom) | 31,4 % | 49,4 % | Topdown L1 |

Para la visualización de los datos se pueden usar *perf record* y *perf report* para visualizar en la consola el uso que tiene cada función y dónde pueden haber hotspots, al analizar el reporte, tenemos hotspots en las siguientes funciones en *cpu-atom* y *cpu-core*:

| Children % | Self % | Comando | Objeto compartido | Símbolo |
|---|---|---|---|---|
| 73,78% | 73,78% | point_cloud_col | point_cloud_collimation | `GridIndex::nearest(Point const&, Point&, double&)` |
| 23,06% | 0,00% | point_cloud_col | ld-linux-x86-64.so.2 | 0x00007f9b83f49868
| 21,90% | 0,00% | point_cloud_col | [unknown] | 0x0000002900000037
| 20,62% | 0,00% | point_cloud_col | ld-linux-x86-64.so.2 |0x00007f9b83f3b3e1
| 20,19% | 0,00% | point_cloud_col | [unknown] | 0x000000460000001b 
| 19,47% | 0,00% | point_cloud_col | ld-linux-x86-64.so.2 | 0x00007f9b83f4ca91
| 19,12% | 0,00% | point_cloud_col | [unknown] |0x0000002a00000020


| Children % | Self % | Comando | Objeto compartido | Símbolo |
|---|---|---|---|---|
| 97,92% | 97,88% | point_cloud_col | point_cloud_collimation | `GridIndex::nearest(Point const&, Point&, double&) const` |
| 17,22% | 0,00% | point_cloud_col | point_cloud_collimation | `std::unordered_map<long, std::vector<int,...>>::...` (operación de lookup) |
| 17,22% | 0,00% | point_cloud_col | point_cloud_collimation | `std::_Hashtable<long, ...>::...` (interno del hash map) |
| 17,22% | 0,00% | point_cloud_col | point_cl ~12–13% (×~20 filas) | 0,00% | point_cloud_col | [unknown] | direcciones sin resolver |oud_collimation | `std::_Hashtable<long, ...>::...` (interno del hash map) |
| 17,22% | 0,00% | point_cloud_col | point_cloud_collimation | `std::_Hashtable<long, ...>::...` (interno del hash map) |
| 14,82% | 0,00% | point_cloud_col | point_cloud_collimation | `std::__detail::_Hash_node_base* std::_Hashtable<long,...>::...` |

Se puede ver muy claramente que la mayoría del tiempo y recursos se queda en el cálculo del vecino más cercano en ambos *cpu-core* y *cpu-atom*.

# Ejercicio D: Perfilado mediante instrumentación

## Metodología

La instrumentación se realizó con `std::chrono::steady_clock`, envolviendo cada
región de interés con un par `t0`/`t1` y calculando la duración en milisegundos
con `std::chrono::duration<double, std::milli>`. El patrón usado en cada región fue:

```cpp
auto t0 = std::chrono::steady_clock::now();
/* región medida */
auto t1 = std::chrono::steady_clock::now();
double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
std::cout << "Time_<region>=" << ms << "\n";
```

El proceso siguió estos pasos:

1. **Primera pasada de instrumentación.** Se instrumentaron las llamadas a función
   con nombre propio dentro de main: `generate_h_rail_cloud`, `add_random_deformation`,
   `estimate_rigid_transform`, `compare_profiles`, `nearest_neighbor_distances`
   (dentro de `compare_profiles`), `centroid_of`, `hypot`, `compose`,
   `apply_transform`, `profile_score`, `score_variation` y `transform_step`. Acá se obtuvo que `collimate_icp` fue la funcion que consumió mas tiempo por lo que se enfoco aca el resto de la perfilación. 
2. **Verificación con el tiempo total.** Se comparó
   `Time_collimate_icp` (el tiempo total de la función que contiene el loop de
   80 iteraciones) contra la suma de todas las sub-regiones medidas dentro de
   ella. En la primera pasada, el gap sin explicar fue de **~9,951 ms (≈33% del
   tiempo total)** — evidencia de que faltaba instrumentar una región
   significativa.
3. **Identificación de la región faltante.** El gap correspondía al loop de
   búsqueda de vecino más cercano usado para construir los emparejamientos
   (`matches`) dentro de `collimate_icp`, que no tiene una llamada a función con
   nombre propio (es un `for` suelto que llama a `index.nearest()` directamente).
4. **Segunda pasada de instrumentación.** Se agregó el timer `Time_match_loop`
   alrededor de ese `for`. Al repetir el presupuesto de tiempo, el gap se redujo
   a **~282 ms (0.93% del tiempo total)** acá ls instrumentación fue considerada completa.


## Resultados: regiones de una sola ejecución (antes del loop del ICP)

| Región | Tiempo (ms) |
|---|---|
| `transform_about_canvas_center` | 0.000059 |
| `generate_h_rail_cloud` | 8.007 |
| `apply_transform` (inicial) | 2.059 |
| `add_random_deformation` | 17.210 |
| `sensor_noise` | 4.801 |
| `compare_profiles` (inicial, antes del loop) | 530.815 |

## Resultados: regiones dentro del loop del ICP (45 iteraciones)

| Región |Suma (ms) | Promedio (ms) | Mín (ms) | Máx (ms) |
|---|---|---|---|---|
| `match_loop` | 9,855.273 | 219.006 | 197.572 | 279.535 |
| `compare_profiles` (total) | 19,444.504 | 432.100 | 382.104 | 534.126 |
| ├─ `nearest_neighbor_distances` | 19,458.520\* | 423.011\* | — | — |
| ├─ `centroid_of` |13.201\* | 0.287\* | — | — |
| └─ `hypot` | 0.027\* | 0.0006\* | — | — |
| `estimate_rigid_transform` |  19.367 | 0.430 | 0.330 | 1.040 |
| `apply_transform` |  81.002 | 1.800 | 1.636 | 2.111 |
| `compose` |  0.007 | 0.0001 | 0.0000 | 0.0006 |
| `match_mse` | 0.001 | 0.0000 | 0.0000 | 0.0000 |
| `profile_score`| 0.006 | 0.0001 | 0.0000 | 0.0005 |
| `score_variation`|  0.006 | 0.0001 | 0.0000 | 0.0005 |
| `transform_step` | 0.016 | 0.0004 | 0.0002 | 0.0007 |



## Verificación con tiempo total

| Concepto | Tiempo (ms) | % del total |
|---|---|---|
| `Time_collimate_icp` (total, medido con timer propio) | 30,212.988 | 100% |
| Suma de todas las regiones instrumentadas dentro de `collimate_icp` | 29,930.996 | 99.07% |
| **Gap sin instrumentar** | **281.992** | **0.93%** |

Este tiempo sin instrumentar se puede deber al overhead que introduce este tipo de instrumentación

## Distribución porcentual del tiempo dentro de `collimate_icp`

| Región | Tiempo (ms) | % del total |
|---|---|---|
| `compare_profiles` (incluye `nearest_neighbor_distances` × 2, `centroid_of` × 2, `hypot`) | 19,444.50 | 64.36% |
| `match_loop` (búsqueda de vecinos para el matching del ICP) | 9,855.27 | 32.62% |
| `compare_profiles` inicial (antes del loop) | 530.81 | 1.76% |
| Resto (`estimate_rigid_transform`, `compose`, `apply_transform`, `match_mse`, `profile_score`, `score_variation`, `transform_step`) | 100.40 | 0.33% |
| Gap sin instrumentar | 281.99 | 0.93% |

---

## Preguntas del Ejercicio D

- ¿La región con mayor tiempo coincide con el hotspot de perf, Google Performance Tools y Valgrind?

- ¿Cuánto overhead introduce su instrumentación?

  Aproximadamente unos 281.922 ms

- ¿Qué partes del programa son más fáciles de entender con instrumentación manual que con muestreo?

- ¿Qué información no puede obtener con instrumentación manual?
