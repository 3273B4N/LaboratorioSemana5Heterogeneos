# Laboratorio semana 5: Optimización

## Índice

- [Ejercicio B](#ejercicio-b)
  - [Metodología](#metodología)
  - [Perfilado con perf](#perfilado-con-perf)
  - [Perfilado con Valgrind Callgrind](#perfilado-con-valgrind-callgrind)
  - [Perfilado con Google Performance Tools (gperftools)](#perfilado-con-google-performance-tools-gperftools)
  - [Comparación de herramientas de profiling](#comparación-de-herramientas-de-profiling)
    - [Tabla comparativa: hotspot principal por herramienta](#tabla-comparativa-hotspot-principal-por-herramienta)
  - [Preguntas](#preguntas)
    - [¿Cuáles funciones aparecen como hotspots en cada herramienta?](#cuáles-funciones-aparecen-como-hotspots-en-cada-herramienta)
    - [¿Los resultados coinciden entre perf, Google Performance Tools y Valgrind? Explique las diferencias.](#los-resultados-coinciden-entre-perf-google-performance-tools-y-valgrind-explique-las-diferencias)
    - [¿Qué costo tiene exportar los archivos de reconstrucción?](#qué-costo-tiene-exportar-los-archivos-de-reconstrucción)
    - [¿Qué herramienta le dio la evidencia más clara para decidir dónde optimizar?](#qué-herramienta-le-dio-la-evidencia-más-clara-para-decidir-dónde-optimizar)
- [Ejercicio C](#ejercicio-c)
  - [Perfilado con Ensamblador](#perfilado-con-ensamblador)
    - [Ubicación de las secciones GridIndex::nearest, compare_profiles, estimate_rigid_transform, add_random_deformation y render_motion_frame](#ubicación-de-las-secciones-gridindexnearest-compare_profiles-estimate_rigid_transform-add_random_deformation-y-render_motion_frame)
  - [¿Dónde aparecen instrucciones o llamadas costosas?](#dónde-aparecen-instrucciones-o-llamadas-costosas)
    - [Funciones trascendentales](#funciones-trascendentales)
    - [Acceso a tablas hash](#acceso-a-tablas-hash)
    - [Acceso contiguo o acceso indirecto](#acceso-contiguo-o-acceso-indirecto)
  - [Saltos condicionales dentro de los bucles internos](#saltos-condicionales-dentro-de-los-bucles-internos)
  - [Regiones limitadas por cómputo y por memoria](#regiones-limitadas-por-cómputo-y-por-memoria)
  - [Perfilado con perf annotate](#perfilado-con-perf-annotate)
  - [Preguntas](#preguntas-1)
    - [¿Qué instrucciones concentran más muestras?](#qué-instrucciones-concentran-más-muestras)
    - [¿Corresponden al hotspot reportado en el Ejercicio B?](#corresponden-al-hotspot-reportado-en-el-ejercicio-b)
    - [¿Qué cambio de código intentaría primero?](#qué-cambio-de-código-intentaría-primero)
- [Ejercicio D: Perfilado mediante instrumentación](#ejercicio-d-perfilado-mediante-instrumentación)
  - [Metodología](#metodología-1)
  - [Resultados: regiones de una sola ejecución](#resultados-regiones-de-una-sola-ejecución)
  - [Resultados: regiones dentro del loop de collimate_icp](#resultados-regiones-dentro-del-loop-de-collimate_icp)
  - [Verificación con tiempo total](#verificación-con-tiempo-total)
  - [Preguntas](#preguntas-2)
- [Ejercicio E](#ejercicio-e)
  - [Entorno de pruebas](#entorno-de-pruebas)
  - [Cambio realizado](#cambio-realizado)
  - [Hipótesis](#hipótesis)
  - [Evidencia antes y después](#evidencia-antes-y-después)
  - [Conclusión](#conclusión)

En este laboratorio se perfilará, analizará y optimizará el código de un colimador que alinea 2 rieles o perfiles H. Este código usa centroides (centros de masa) para calcular distancias, se usan 2 perfiles, uno de referencia y otro de estado actual, el centroide de referencia nunca se mueve, pero el de estado actual es el que se usa para medir desplazamientos y distancias. Esta distancia por medio de traslaciones, rotaciones y transformaciones, siempre comparando y recalculado, cada iteración para acercarse a la alineación de los rieles. Para hacer estas comparaciones y mediciones se usan varios medidores, pero 3 son de interés: *match_rsme*, *symmetric_chamfer_rmse*, *profile_score*:
* match_rmse: RMSE calculado solo sobre los emparejamientos usados para estimar la transformación de esa iteración. Es una medida "interna" del ajuste local usado para la optimización, dice qué tan bien va cada iteración, qué tanto "match" hace entre los rieles.
* symmetric_chamfer_rmse: ombina las distancias vecino-más-cercano en ambas direcciones sobre toda la nube Es una medida más completa de qué tan bien coinciden los dos perfiles como conjuntos.
* profile_score: Es la que se usa como criterio de convergencia global. Combina el ajuste de forma (chamfer) con el ajuste de posición global (centroides), normalizado por el tamaño del canvas para que sea adimensional/comparable.

Otro dato a analizar son las transformaciones que genera el sistema a los rieles y por qué la transformación no rígida impide recuperar exactamente al transformación ideal. La transformación "ideal" es una rotación + traslación pura, generada con transform_about_canvas_center. Pero antes de correr el ICP, main le aplica a source dos cosas adicionales:

add_random_deformation: desplaza cada punto con una combinación de ondas senoidales globales y bultos direcciones aleatorias, esto es una deformación no rígida, es decir, distinta para cada punto según su posición, no una rotación/traslación uniforme.
Estimate_rigid_transform solo puede modelar transformaciones rígidas. Como la nube fuente real ya no es una copia rígida exacta del target, no existe ninguna rotación+traslación única que mapee todos los puntos deformados exactamente sobre el target. El algoritmo encuentra la mejor rotación/traslación en promedio sobre los emparejamientos, pero cada iteración empareja puntos por vecino-más-cercano, y esos emparejamientos ya están contaminados por el desplazamiento no uniforme de la deformación.
El resultado converge, pero nunca es perfecto porque la deformación real no es representable por el modelo rígido.

# Ejercicio B

El código se perfilará con 3 herramientas: *perf*, *valgrind/callgrind* y *google-perf/pprof*.

## Metodología 

Se emplearon tres instrumentos de análisis de rendimiento: **perf**, **Valgrind Callgrind** y **Google Performance Tools (gperftools)** para identificar los puntos críticos del programa `point_cloud_collimation`. Para calcular el costo extra de escribir los archivos de reconstrucción en disco, cada herramienta se utilizó con dos configuraciones: una sin `--export` y otra con `--export`.

Para gperftools, el programa se recompiló vinculando de manera explícita `libprofiler` (`-lprofiler`), y los perfiles se produjeron usando la variable `CPUPROFILE`, que luego fueron examinados a través de `google-pprof --text`. Para Valgrind, se utilizó `callgrind_annotate` para conseguir el desglose de instrucciones que fueron ejecutadas por cada línea de código. Para comprobar la consistencia entre diferentes métodos de medición (es decir, entre el muestreo estadístico y el conteo exacto de instrucciones), se compararon los resultados de las dos herramientas entre sí y con los datos obtenidos de `perf stat` o `perf report` en otra máquina.

## Perfilado con *perf*
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


## Perfilado con *Valgrind Callgrind*

El perfilado con Callgrind simula la ejecución completa del programa e instrumenta cada instrucción ejecutada, dando un conteo exacto (no muestreado) del costo por función y por línea de código. Se ejecutó en dos configuraciones:

valgrind --tool=callgrind ./point_cloud_collimation

valgrind --tool=callgrind ./point_cloud_collimation --export

Cada corrida genera un archivo `callgrind.out.<PID>`, analizado luego con:

callgrind_annotate callgrind.out.<PID>

Debido al overhead de instrumentación de Valgrind (entre 20 y 50 veces más lento que la ejecución normal), cada corrida tomó varios minutos en completarse. A cambio, esta herramienta ofrece el desglose más preciso y granular, permitiendo ver línea por línea del código fuente cuáles instrucciones concentran más ciclos de CPU.

Se presentan los datos generales del perfilado:

| Métrica | Sin --export | Con --export | Notas |
|---|---|---|---|
| **Instrucciones totales (Ir)** | 203,397,705,129 | 239,891,504,097 | +17.9% por I/O de exportación |
| **GridIndex::nearest** | 83.40% | 70.71% | Hotspot dominante en ambas configuraciones |
| Acceso a std::vector (dentro de nearest) | 10.28% | 8.72% | Vía stl_vector.h |
| Hashtable interno (hashtable.h + policy) | ~4.5% | ~3.42% | Estructuras de std::unordered_map |
| write_cloud_csv (acumulado, 29 invocaciones) | — | 12.14% | Solo aparece con --export |
| printf_fp / hack_digit (formateo de texto) | — | ~5.3% | Solo aparece con --export |


## Perfilado con *Google Performance Tools (gperftools)*

Se corrió el código usando gperftools (paquetes `google-perftools` y `libgoogle-perftools-dev`). A diferencia de Valgrind, gperftools usa muestreo por señales de tiempo, con mucho menor overhead, lo que permite ejecuciones a velocidad casi normal.

Para generar los perfiles, primero fue necesario recompilar el programa forzando al enlazador a conservar la biblioteca `libprofiler`:

make CXXFLAGS="-std=c++17 -O2 -g -Wall -Wextra -pedantic -fno-omit-frame-pointer" \
GST_LIBS="-Wl,--no-as-needed -lprofiler -Wl,--as-needed $(pkg-config --libs gstreamer-1.0 gstreamer-app-1.0)"

Y verificando el enlace con:

ldd ./point_cloud_collimation | grep profiler

Los perfiles se generaron definiendo la variable `CPUPROFILE`, en las mismas dos configuraciones (con y sin `--export`):

CPUPROFILE=point_cloud.prof ./point_cloud_collimation

CPUPROFILE=point_cloud_export.prof ./point_cloud_collimation --export

Y se analizaron con:

google-pprof --text ./point_cloud_collimation point_cloud.prof

Se presentan los datos generales del perfilado:

| Métrica | Sin --export | Con --export | Notas |
|---|---|---|---|
| **Total de samples** | 2,844 | 3,338 | +17.4% por I/O de exportación |
| **GridIndex::nearest** | 73.9% | 66.4% | Hotspot dominante en ambas configuraciones |
| _Hashtable::_M_find_before_node (inline) | 8.1% | 6.4% | Búsqueda dentro de la hashtable de celdas |
| nearest_neighbor_distances (cum) | 64.8% | 58.0% | Función que envuelve las llamadas a nearest() |
| export_reconstruction (inline) | — | 10.4% | Solo aparece con --export |
| write_cloud_csv | — | 9.5% | Solo aparece con --export |
| printf_fp_l / num_put (formateo de texto) | — | ~10.4% | Solo aparece con --export |


## Comparación de herramientas de profiling 

### Tabla comparativa: hotspot principal por herramienta

| Herramienta | Configuración | % en GridIndex::nearest | Referencia |
|---|---|---|---|
| perf (perf report) | sin --export | 73.78% (children/self) | - |
| perf (perf report, cpu-core) | con --export | 97.88% (self) | - |
| gperftools | sin --export | 73.9% | 2,844 samples totales |
| gperftools | con --export | 66.4% | 3,338 samples totales (+17.4%) |
| Valgrind Callgrind | sin --export | 83.40% | 203,397,705,129 instrucciones (Ir) |
| Valgrind Callgrind | con --export | 70.71% | 239,891,504,097 instrucciones (Ir) (+17.9%)|

## Preguntas

### ¿Cuáles funciones aparecen como hotspots en cada herramienta?

**perf:**
- `GridIndex::nearest` aparece como el hotspot dominante en ambos desgloses de arquitectura reportados (73.78% en la agrupación cpu-atom y 97.88% self en la agrupación cpu-core)
- Funciones internas de hashtable (`std::unordered_map::find`, `std::_Hashtable`) como consumidoras secundarias de alrededor de 17% cada una

**gperftools:**
- `GridIndex::nearest` — 73.9% (sin --export), 66.4% (con --export)
- `std::_Hashtable::_M_find_before_node` (inline) — 8.1% / 6.4%
- Con `--export` aparecen además: `export_reconstruction` (10.4%), `write_cloud_csv` (9.5%), y funciones de formateo de números (`__GI___printf_fp_l`, `std::num_put`)

**Valgrind Callgrind:**
- `GridIndex::nearest` — 83.40% (sin --export), 70.71% (con --export)
- Acceso a `std::vector` dentro de `nearest` (vía `stl_vector.h`) — 10.28% / 8.72%
- `std::hashtable` y `hashtable_policy` internos — ~2-4% cada uno
- Con `--export`, la llamada a `write_cloud_csv` desde `export_reconstruction` acumula 12.14% del total (correspondiente a sus 29 invocaciones dentro del ciclo de exportación de frames)


En las tres herramientas, **`GridIndex::nearest` es la función que prevalece de manera dominante**, mientras que las funciones secundarias están relacionadas con las estructuras internas de `std::unordered_map`.

### ¿Los resultados coinciden entre perf, Google Performance Tools y Valgrind? Explique las diferencias.

Sí, las tres herramientas concuerdan en que `GridIndex::nearest` es el hotspot más dominante del programa, aunque con porcentajes diferentes (de 66 % a 97 %, dependiendo de la herramienta y de la configuración). Las diferencias se deben a cómo se mide cada una: perf emplea muestreo estadístico por eventos de hardware, con interrupciones periódicas del CPU, y es sensible al tipo de núcleo en el que corre (cpu-core reportó 97.88% self mientras que cpu-atom reportó 73.78%, para la misma ejecución). Gperftools también emplea el muestreo, aunque lo hace a través de señales temporales, con un overhead más bajo que Valgrind, pero una precisión inferior a la de un conteo exhaustivo. Por otro lado, Valgrind Callgrind simula el programa entero e instrumenta cada instrucción que se ejecuta, lo que proporciona la contabilización más precisa y exhaustiva de las tres (83.40% sin --export), ya que no se basa en muestreo sino en un conteo real de instrucciones. Las tres concuerdan además en el mecanismo interno del cuello de botella: el costo se concentra en las operaciones de hashtable (`_M_find_node`, `_M_find_before_node`, `_M_bucket_index`), que emplean `GridIndex::nearest` para localizar puntos por celda. 

### ¿Qué costo tiene exportar los archivos de reconstrucción?

Las tres herramientas concuerdan en que la exportación supone un costo adicional real, aunque sea secundario en comparación con el costo del algoritmo de emparejamiento. Con perf, el tiempo total aumentó de 23.80s a 25.36s (+6.5%), y el tiempo del sistema casi se triplicó (0.064s → 0.184s) a causa del I/O de escritura en disco. Con gperftools, el número total de muestras aumentó de 2,844 a 3,338 (un incremento del 17.4%), con la introducción de nuevas funciones como `export_reconstruction` (10.4%) y `write_cloud_csv` (9.5%), así como trabajo de formateo de números en texto (`printf_fp`, `num_put`). Con Valgrind, las instrucciones anotadas aumentaron de cerca de 203.4 a 239.9 mil millones, lo que representa un incremento del 17.9%. En la versión con exportación, la llamada a `write_cloud_csv` desde `export_reconstruction` acumuló 12.14% del total de instrucciones, correspondiente a sus 29 invocaciones dentro del ciclo de exportación de frames, aunque el costo propio de la función por sí sola es menor.

### ¿Qué herramienta le dio la evidencia más clara para decidir dónde optimizar?

Valgrind Callgrind proporcionó la evidencia más exacta y accionable porque mide instrucciones precisas en lugar de apoyarse en el muestreo, y posibilita observar, línea por línea, las operaciones que dentro de `GridIndex::nearest` requieren más ciclos. Por ejemplo, el cálculo de distancia al cuadrado (`ex*ex + ey*ey`) y la iteración de puntos dentro de cada celda representan entre el 12% y el 15% del total de instrucciones. Perf y gperftools fueron capaces de determinar con rapidez cuál era la función principal que constituía el hotspot, sin requerir el nivel de detalle línea por línea que proporciona Valgrind; además, su ejecución fue más rápida. Para un diagnóstico inicial, perf y gperftools son más útiles; Valgrind proporciona la evidencia más exacta y fiable para determinar con precisión qué línea de código abordar primero.

# Ejercicio C

## Perfilado con Ensamblador

```bash
make clean
make CXXFLAGS="-std=c++17 -O2 -g -Wall -Wextra -pedantic -fno-omit-frame-pointer"

g++ -std=c++17 -O2 -g -S -masm=intel \
  $(pkg-config --cflags gstreamer-1.0 gstreamer-app-1.0) \
  point_cloud_collimation.cpp -o point_cloud_collimation.s

objdump -drwC -Mintel ./point_cloud_collimation > point_cloud_collimation.objdump
```

### Ubicación de las secciones `GridIndex::nearest`, `compare_profiles`, `estimate_rigid_transform`, `add_random_deformation` y `render_motion_frame`

Al identificar las 5 regiones solicitadas usando:

```bash
grep -n "GridIndex::nearest" point_cloud_collimation.objdump | head -5
grep -n "compare_profiles" point_cloud_collimation.objdump | head -5
grep -n "render_motion_frame" point_cloud_collimation.objdump | head -5
grep -n "estimate_rigid_transform" point_cloud_collimation.objdump | head -5
grep -n "add_random_deformation" point_cloud_collimation.objdump | head -5
```

| Función | Dirección |
| :--- | :--- |
| `GridIndex::nearest` | `0xcae0` |
| `compare_profiles` | `0xbaf0` |
| `render_motion_frame` | `0x7ff0` |
| `estimate_rigid_transform` | - |
| `add_random_deformation` | - |

Nos encontramos con que solo tres de las cinco funciones existen como símbolo independiente (`GridIndex::nearest`, `compare_profiles` y `render_motion_frame`). Las otras dos (`estimate_rigid_transform` y `add_random_deformation`) desaparecieron porque `-O2` aplicó *function inlining*. Básicamente, el compilador sustituyó la llamada por el cuerpo de la función en el punto de invocación.

Aunque no tienen símbolo propio, sus regiones se pueden delimitar por las llamadas que solo ellas hacen: `add_random_deformation` es la única que invoca `exp` (`0x6c10` a `0x6da8`) y `estimate_rigid_transform` la única que combina `atan2` con `sincos` (`0x6274` a `0x6322`).

También se ubicó `nearest_neighbor_distances` en `0x8900`. No está en la lista solicitada, pero es la función intermedia entre `compare_profiles` y `GridIndex::nearest`, así que se incluye en el análisis.

Para analizar cada función por separado y no tener que navegar las 849 KB del desensamblado completo, se extrajo cada región a su propio archivo:

```bash
mkdir -p asm_regions
awk '/^000000000000cae0/,/^$/' point_cloud_collimation.objdump > asm_regions/gridindex_nearest.asm
awk '/^000000000000baf0/,/^$/' point_cloud_collimation.objdump > asm_regions/compare_profiles.asm
awk '/^0000000000008900/,/^$/' point_cloud_collimation.objdump > asm_regions/nearest_neighbor_distances.asm
awk '/^0000000000007ff0/,/^$/' point_cloud_collimation.objdump > asm_regions/render_motion_frame.asm
```

## ¿Dónde aparecen instrucciones o llamadas costosas?

### Funciones trascendentales

Podemos buscarlas usando:

```bash
grep -n "call.*\(sqrt\|sin\|cos\|exp\|atan\|hypot\|pow\)" point_cloud_collimation.objdump
```

| Dirección | Llamada | Función de origen | Línea `.cpp` |
| :--- | :--- | :--- | ---: |
| `0x62ba` | `atan2@plt` | `estimate_rigid_transform` (inlineada) | 325 |
| `0x62d2` | `sincos@plt` | `estimate_rigid_transform` (inlineada) | 326-327 |
| `0x64ed` | `hypot@plt` | `collimate_icp` (`transform_step`) | 585 |
| `0x6c42` | `sin@plt` | `add_random_deformation` (inlineada) | 158 |
| `0x6c88` | `sin@plt` | `add_random_deformation` (inlineada) | 161 |
| `0x6d6a` | `exp@plt` | `add_random_deformation` (inlineada) | 170 |
| `0x6e6b` | `sqrt@plt` | `add_random_deformation` | 180 |
| `0x8e1a` | `sqrt@plt` | `nearest_neighbor_distances` | 390 |
| `0xc214` | `hypot@plt` | `compare_profiles` (`centroid_distance`) | 443 |
| `0xca56` | `sqrt@plt` | `compare_profiles` (`rmse_from_distances`) | 455 |
| `0xca60` | `sqrt@plt` | `compare_profiles` (`rmse_from_distances`) | 456 |
| `0xca6a` | `sqrt@plt` | `compare_profiles` (`rmse_from_distances`) | 457 |

### Acceso a tablas hash

```bash
grep -n "call.*unordered\|call.*_M_find\|call.*hash" point_cloud_collimation.objdump
```

| Dirección | Símbolo | Contexto |
| :--- | :--- | :--- |
| `0x5b3b` | `_Map_base::operator[]` | Construcción del `GridIndex` en `collimate_icp` |
| `0xbcdc` | `_Map_base::operator[]` | Primer `GridIndex` de `compare_profiles` |
| `0xbea1` | `_Map_base::operator[]` | Segundo `GridIndex` de `compare_profiles` |
| `0xd320` | `~_Hashtable()` | Destructores (8 sitios) |
| `0xee79` | `_M_need_rehash` | Política de redimensionado |
| `0xeeb7` | `_M_rehash` | Redimensionado efectivo |

Se logra identificar a qué función pertenece cada sección comparando las direcciones ubicadas anteriormente: `GridIndex::nearest` empieza en `0xcae0`, `compare_profiles` en `0xbaf0` y `render_motion_frame` en `0x7ff0`.

Buscar instrucciones costosas resulta engañoso si se toma como único criterio.

Las llamadas trascendentales se concentran en `add_random_deformation`, que se ejecuta una sola vez en todo el programa, y en `compare_profiles`, que hace apenas 3 `sqrt` y 1 `hypot` por invocación.

Mientras tanto, `GridIndex::nearest`, la función que más veces se ejecuta, no contiene ni una sola llamada costosa. Opera sobre distancias al cuadrado (`d2`) y nunca extrae la raíz, así que evita esa operación en el bucle que más se repite. El costo de esa función no está en instrucciones caras, sino en la cantidad de instrucciones baratas que ejecuta.

### Acceso contiguo o acceso indirecto

Para esta parte se analiza el patrón de acceso en los bucles identificando el salto hacia atrás que los cierra. De esta forma:

`GridIndex::nearest` usa acceso indirecto. Tiene dos bucles anidados, cada uno con su propio patrón.

El primero recorre la cadena del bucket hash (`0xcc68` a `0xcc74`):

```asm
cc68:  mov    rax,QWORD PTR [rax]      ; la dirección se lee de memoria
cc70:  cmp    rsi,QWORD PTR [rax+0x8]  ; compara la clave
cc74:  jne    cc68                     ; sigue recorriendo
```

El segundo recorre los candidatos de la celda (`0xcc90` a `0xccde`):

```asm
cc90:  movsxd rax,DWORD PTR [rdx]      ; lee un índice
cc9e:  shl    rax,0x4                  ; * 16
cca2:  add    rax,r8                   ; base + offset
cca5:  subsd  xmm0,QWORD PTR [rax]     ; lee points_[index]
ccd7:  add    rdx,0x4                  ; siguiente índice
```

En el primero, la dirección sale de otra lectura. En el segundo, se calcula a partir de un índice. En ambos casos, el procesador no sabe qué va a leer hasta que llega el dato anterior, por lo que no puede adelantarse.

`add_random_deformation` usa acceso contiguo:

```asm
6d28:  add    r14,0x28                 ; paso fijo de 40 bytes
6d2c:  subsd  xmm0,QWORD PTR [r14-0x28]
```

El registro suma siempre lo mismo, así que la siguiente dirección es predecible.

| Región | Patrón |
| :--- | :--- |
| `GridIndex::nearest` | Indirecto |
| `compare_profiles` | Indirecto (llama a `nearest`) |
| `add_random_deformation` | Contiguo |
| `estimate_rigid_transform` | Contiguo |
| `render_motion_frame` | Indirecto en escritura |

## Saltos condicionales dentro de los bucles internos

Sí los hay. En `GridIndex::nearest`, repartidos entre los dos bucles:

| Dirección | Instrucción | Bucle |
| :--- | :--- | :--- |
| `0xcc6e` | `je cc20` | cadena hash |
| `0xcc74` | `jne cc68` | cadena hash |
| `0xccc3` | `jbe ccd7` | candidatos |
| `0xccde` | `jne cc90` | candidatos |

Se puede contar por región usando:

```bash
grep -cE "\s(je|jne|jb|jbe|ja|jae|jl|jle|jg|jge|js|jns)\s" asm_regions/*.asm
```

| Región | Saltos |
| :--- | ---: |
| `GridIndex::nearest` | 22 |
| `nearest_neighbor_distances` | 29 |
| `compare_profiles` | 61 |
| `render_motion_frame` | 6 |

## Regiones limitadas por cómputo y por memoria

Se puede clasificar cada región combinando lo anterior: cuántas operaciones aritméticas hace, qué patrón de acceso usa y si llama a funciones matemáticas.

| Región | Limitada por | Razón |
| :--- | :--- | :--- |
| `GridIndex::nearest` | Memoria | Solo 5 operaciones SSE por candidato (`subsd`, `subsd`, `mulsd`, `mulsd`, `addsd`), acceso indirecto y ninguna llamada costosa |
| `compare_profiles` | Memoria | Construye dos tablas hash por llamada y delega 200000 búsquedas a `nearest` |
| `nearest_neighbor_distances` | Memoria | Envoltorio de `nearest`, agrega una `sqrt` por punto |
| `add_random_deformation` | Cómputo | Acceso contiguo, pero ejecuta 2 `sin`, 8 `exp` y una división por punto |
| `estimate_rigid_transform` | Cómputo | Bucle de acumulación contiguo; `atan2` y `sincos` se ejecutan una vez al final |
| `render_motion_frame` | Memoria | Escribe 2 MB por cuadro con offsets calculados por punto, casi sin aritmética |

La única región limitada por cómputo que pesa es `add_random_deformation`, y se ejecuta una sola vez. Todo lo que se repite en las 45 iteraciones del ICP está limitado por memoria.

## Perfilado con perf annotate

```bash
perf record -g ./point_cloud_collimation
perf annotate
```

En este equipo hubo que bajar antes `perf_event_paranoid`, que estaba en `4` y bloqueaba los contadores de hardware:

```bash
sudo sysctl kernel.perf_event_paranoid=1
```

Sin ese ajuste la grabación capturaba solo 59 muestras del enlazador dinámico. Después capturó 92828.

El procesador es híbrido y expone dos PMU (`cpu_core` y `cpu_atom`). `perf annotate` procesa una sola, así que la anotación usó 266 muestras del evento `cpu_atom`.

## Preguntas 

### ¿Qué instrucciones concentran más muestras?

| Porcentaje | Instrucción | Dirección |
| ---: | :--- | :--- |
| 22.15 % | `subsd (%rax),%xmm0` | `0xcca5` |

Es la lectura de `points_[index].x` en el bucle de candidatos de `GridIndex::nearest`.

No es una operación aritmética ni una llamada matemática: es una lectura de memoria con dirección indirecta. Lo que cuesta es esperar que llegue el dato, no la resta en sí.

### ¿Corresponden al hotspot reportado en el Ejercicio B?

Sí.

| Fuente | Resultado |
| :--- | :--- |
| Ensamblador | `GridIndex::nearest` usa acceso indirecto y tiene la mayor densidad de saltos |
| `perf report` (propio) | `GridIndex::nearest` con 88.96 % |
| `perf report` (Ejercicio B) | 73.78 % en `cpu_atom`, 97.92 % en `cpu_core` |
| `perf annotate` | `subsd (%rax),%xmm0` con 22.15 % |

Dos datos del Ejercicio B respaldan la clasificación por memoria: el reporte de `cpu_core` muestra `_Hashtable` con 17.22 %, que corresponde al recorrido de buckets visto en `0xcc68`; y `perf stat` reporta backend bound de 39.4 % como cuello dominante.

Las tasas de branch misses (1.9 % y 2.4 %) son moderadas, así que los saltos condicionales no son el factor limitante principal.

### ¿Qué cambio de código intentaría primero?

Con base en el análisis del ensamblador, el primer cambio que intentaría sería cambiar la estructura de vecinos, ya que `GridIndex::nearest` es la región que concentra la mayor cantidad de tiempo. El problema principal no parece estar en una operación matemática específica, sino en la forma en que se accede a los datos. El bucle interno utiliza accesos indirectos mediante índices, por lo que la dirección de memoria que se necesita leer depende de datos obtenidos previamente. Esto dificulta que el procesador pueda anticipar las siguientes lecturas.

Las otras opciones tendrían una prioridad menor según los resultados obtenidos. La escritura de archivos y el renderizado no representan una parte importante del tiempo total, mientras que reducir cálculos de distancia tendría un impacto limitado, ya que `GridIndex::nearest` trabaja principalmente con distancias al cuadrado y evita realizar `sqrt` dentro de su bucle más caliente. De igual forma, paralelizar los bucles podría repartir el trabajo, pero no solucionaría el problema principal de los accesos indirectos a memoria.

Por esto, intentaría primero optimizar la estructura utilizada para realizar la búsqueda de vecinos. Una posibilidad concreta sería evitar reconstrucciones innecesarias del `GridIndex` del perfil objetivo. En `compare_profiles` se identificaron dos llamadas a `_Map_base::operator[]` relacionadas con la construcción de `GridIndex`. Como el perfil objetivo permanece constante durante las iteraciones del ICP, investigaría si este índice puede construirse una sola vez y reutilizarse.

La idea sería reducir el trabajo repetitivo sin modificar el resultado del algoritmo. Después de implementar el cambio, se debería comparar nuevamente el tiempo de ejecución y verificar que los resultados de `profile_metrics.csv` se mantengan iguales.


# Ejercicio D: Perfilado mediante instrumentación

## Metodología

La instrumentación se realizó con `std::chrono::steady_clock`, envolviendo cada
región de interés con un par `t0`/`t1` y calculando la duración en milisegundos
con `std::chrono::duration<double, std::milli>`. 


El proceso siguió estos pasos:
1. **Primera pasada de instrumentación.** Se instrumentaron las llamadas a función
   con nombre propio dentro de main: `generate_h_rail_cloud`, `add_random_deformation`,
   `estimate_rigid_transform`, `compare_profiles`, `nearest_neighbor_distances`
   (dentro de `compare_profiles`), `centroid_of`, `hypot`, `compose`,
   `apply_transform`, `profile_score`, `score_variation` y `transform_step`. Acá se
   obtuvo que `collimate_icp` fue la función que consumió más tiempo, por lo que
   se enfocó ahí el resto de la perfilación.
2. **Verificación contra tiempo total.** Se comparó
   `Time_collimate_icp` (el tiempo total de la función que contiene el loop de
   80 iteraciones, medido con `chrono`) contra la suma de todas las sub-regiones
   medidas dentro de ella (también con `chrono`). En la primera pasada, el tiempo
   sin explicar fue de **~9,951 ms (≈33% del tiempo total)**, lo cual evidenció
   que faltaba instrumentar una región.
3. **Identificación de la región faltante.** El tiempo sin medir correspondía al loop de
   búsqueda de vecino más cercano usado para construir los emparejamientos
   (`matches`) dentro de `collimate_icp`, que no tiene una llamada a función con
   nombre propio (es un for suelto que llama a `index.nearest()` directamente).
4. **Segunda pasada de instrumentación.** Se agregó el timer `Time_match_loop`
   alrededor de ese `for`. Al repetir la verificación, el tiempo
   sin explicar se redujo a **~282 ms (0.93% del tiempo total)**, por lo que la
   instrumentación se consideró completa. Posteriormente, en la sección
   "Verificación con tiempo total", se contrastó este resultado contra el
   tiempo real de ejecución reportado por la shell, para estimar el overhead
   que introduce la instrumentación.

## Resultados: regiones de una sola ejecución 
| Región | Tiempo (ms) |
|---|---|
| `transform_about_canvas_center` | 0.000059 |
| `generate_h_rail_cloud` | 8.007 |
| `apply_transform` (inicial) | 2.059 |
| `add_random_deformation` | 17.210 |
| `sensor_noise` | 4.801 |
| `compare_profiles` (inicial, antes del loop) | 530.815 |
| `collimate_icp`  | 30,212.988 |

## Resultados: regiones dentro del loop de `collimate_icp` 

| Región | Suma (ms) | % del total | Promedio (ms) | Mín (ms) | Máx (ms) |
|---|---|---|---|---|---|
| `match_loop` | 9,855.273 | 32.62% | 219.006 | 197.572 | 279.535 |
| `compare_profiles` (total) | 19,444.504 | 64.36% | 432.100 | 382.104 | 534.126 |
| ├─ `nearest_neighbor_distances` | 19,458.520\* | 64.40%\* | 423.011\* | — | — |
| ├─ `centroid_of` | 13.201\* | 0.04%\* | 0.287\* | — | — |
| └─ `hypot` | 0.027\* | 0.0001%\* | 0.0006\* | — | — |
| `estimate_rigid_transform` | 19.367 | 0.06% | 0.430 | 0.330 | 1.040 |
| `apply_transform` | 81.002 | 0.27% | 1.800 | 1.636 | 2.111 |
| `compose` | 0.007 | 0.00002% | 0.0001 | 0.0000 | 0.0006 |
| `match_mse` | 0.001 | 0.000003% | 0.0000 | 0.0000 | 0.0000 |
| `profile_score` | 0.006 | 0.00002% | 0.0001 | 0.0000 | 0.0005 |
| `score_variation` | 0.006 | 0.00002% | 0.0001 | 0.0000 | 0.0005 |
| `transform_step` | 0.016 | 0.00005% | 0.0004 | 0.0002 | 0.0007 |

Nota: aca se cuentan todas las iteraciones del for dentreo de `collimate_icp`, el % se calculo respecto al tiempo total de ejecucion de esta funcion encontrado anteriormente.

## Verificación con tiempo total
Para verificar si se estaba midiendo todo el programa, se comparó el tiempo total medido con el tiempo de ejecucion real reportado por time.
| Concepto | Tiempo (ms) |
|---|---|
| Tiempo real de ejecución  | 30,170.0 |
| Suma de toda la instrumentacion | 30,158.901 |
| Tiempo sin medir | ~11.1 (0.04%) |

Este tiempo sin medir se toma como el overhead que introduce este tipo de instrumentación debido a que no se encontro otra funcion que pudiera añadir mas tiempo.


---

## Preguntas

- ¿La región con mayor tiempo coincide con el hotspot de perf, Google Performance Tools y Valgrind?

   Aunque con los otros metodos de instrumentacion se encontro que el cuello de botella era el metodo `nearest`, si se coincidió en la region que llama a este metodo el cual fue la función de `nearest_neighbor_distances`
- ¿Cuánto overhead introduce su instrumentación?

  Aproximadamente unos 11.1 ms

- ¿Qué partes del programa son más fáciles de entender con instrumentación manual que con muestreo?

   Los ciclos y las llamadas de funciones son más fáciles de entender con instrumentación manual ya que al tener que poner los puntos a revisar se puede verificar si una función está siendo llamada iterativamente y si el uso que se le da a esta función en una parte específica del programa puede añadir más tiempo, por ejemplo varias funciones hacen uso de el método `nearest` de la clase `GridIndex` sin embargo `nearest_neighbor_distances` fue la función que se encontró que hace un uso más excesivo de este método (reflejado en su tiempo de ejecución).

- ¿Qué información no puede obtener con instrumentación manual?

   No se puede ver que es lo que se esta compilando o ejecutando (no se hace un análisis del codigo ensamblador), ademas de que no se pueden ver otras metricas de hardware que pueden estar afectando la ejecucion del programa por ejemplo los cache-misses o los branch-misspredictions



# Ejercicio E

### Entorno de pruebas 

Las mediciones se realizaron en un equipo con procesador **Intel Core i7-1165G7** (11th Gen), con 4 núcleos físicos y 8 hilos (2 hilos por núcleo vía Hyper-Threading), frecuencia máxima de 4.70 GHz y arquitectura x86_64. 

### Cambio realizado 

Se identificó la función nearest_neighbor_distances como el principal cuello de botella del programa a partir de las pruebas realizadas con perf, Valgrind Callgrind y Google Performance Tools (Ejercicio B) y con la instrumentación manual utilizando std::chrono (Ejercicio D); posteriormente, se paralelizó dicha función. El cambio implicó añadir la directiva `#pragma omp parallel for` al bucle que ya existía en esta función, de modo que las llamadas a GridIndex::nearest() para cada punto de la nube se distribuyeran entre varios hilos de CPU.

### Hipótesis 

Cada llamada de GridIndex::nearest() que se hace dentro de nearest_neighbor_distances es autónoma, ya que no intercambia estado mutable entre diferentes ubicaciones en la nube, y GridIndex::nearest() es una función constante que únicamente lee la estructura de celdas previamente creada. Por ende, se prevé que la repartición de 100,000 llamadas a nearest() entre los núcleos accesibles del CPU acorte el tiempo de pared que toma esta función de manera prácticamente proporcional a la cantidad de hilos empleados, sin cambiar el resultado numérico del algoritmo (distancias iguales, profile_score igual, coverage igual), porque no se altera la lógica para buscar al vecino más cercano; solamente cambia cómo se distribuye el trabajo entre los hilos.


### Evidencia antes y después

| Métrica | Original | Paralelizado | Cambio |
|---|---|---|---|
| Tiempo real (`time`) | 30.957 s | 15.144 s | **-51.1%** |
| Tiempo elapsed (`perf stat`) | 29.041 s | 14.661 s | **-49.5%** |
| CPUs utilizados (`perf stat`) | 1.000 | 3.432 | +243% |
| Instrucciones totales (`perf stat`) | 203,798,427,029 | 204,599,948,676 | +0.4% (prácticamente igual) |
| Ciclos (`perf stat`) | 108,983,409,537 | 173,165,219,011 | +58.9% |
| IPC (insn/ciclo) | 1.87 | 1.18 | -37% |
| Branch misses | 2.28% | 2.13% | Similar |
| Total samples (`gperftools`) | 2,831 | 5,246 | +85.3% (esperado por más CPU-tiempo) |
| `GridIndex::nearest` self (`gperftools`) | 71.7% | 68.3% | Se mantiene como hotspot dominante |
| `nearest_neighbor_distances` cum (`gperftools`) | 65.1% | 69.4% (vía `_omp_fn.0`) | Confirma paralelización activa |
| Iteraciones para converger | 45 | 45 | Sin cambio |
| profile_score final | 0.01847086 | 0.01847086 | Sin cambio |
| coverage final | 96.94% | 96.94% | Sin cambio |

**Evidencia con time**

Original
| Tipo | Tiempo |
|---|---|
| real | 0m30.957s |
| user | 0m30.886s |
| sys | 0m0.067s |

Paralelizado
| Tipo | Tiempo |
|---|---|
| real | 0m15.144s |
| user | 0m52.526s |
| sys | 0m0.041s |


**Evidencia con perf stat**

Original

| Métrica | Valor |
|---|---|
| Task-clock | 29,035.14 msec |
| CPUs utilizados | 1.000 |
| Context switches | 211 |
| CPU migrations | 3 |
| Page faults | 44,519 |
| Ciclos | 108,983,409,537 |
| Instrucciones | 203,798,427,029 |
| IPC | 1.87 |
| Branches | 26,649,143,781 |
| Branch misses | 607,406,801 (2.28%) |
| Tiempo elapsed | 29.041149885 s |
| Tiempo user | 28.974118000 s |
| Tiempo sys | 0.061993000 s |

Paralelizado

| Métrica | Valor |
|---|---|
| Task-clock | 50,319.19 msec |
| CPUs utilizados | 3.432 |
| Context switches | 4,176 |
| CPU migrations | 34 |
| Page faults | 12,996 |
| Ciclos | 173,165,219,011 |
| Instrucciones | 204,599,948,676 |
| IPC | 1.18 |
| Branches | 26,870,833,864 |
| Branch misses | 572,133,430 (2.13%) |
| Tiempo elapsed | 14.661057235 s |
| Tiempo user | 50.239416000 s |
| Tiempo sys | 0.080884000 s |


**Evidencia con gperftools**

Original (Total: 2,831 samples)

| Muestras | Self % | Cum % | Función |
|---|---|---|---|
| 2029 | 71.7% | 97.7% | `GridIndex::nearest` |
| 233 | 8.2% | 79.9% | `std::_Hashtable::_M_find_before_node` (inline) |
| 171 | 6.0% | 85.9% | `std::__detail::_Mod_range_hashing::operator` (inline) |
| 131 | 4.6% | 90.6% | `std::__detail::_Hashtable_base::_M_equals` (inline) |
| 6 | 0.2% | 65.1% (cum) | `nearest_neighbor_distances` [clone .constprop.0] |


Paralelizado (Total: 5,246 samples)

| Muestras | Self % | Cum % | Función |
|---|---|---|---|
| 3582 | 68.3% | 86.8% | `GridIndex::nearest` |
| 626 | 11.9% | 80.2% | `omp_get_num_procs@@OMP_1.0` |
| 290 | 5.5% | 85.7% | `std::_Hashtable::_M_find_before_node` (inline) |
| 2 | 0.0% | 69.4% (cum) | `nearest_neighbor_distances` [clone ._omp_fn.0] |


**Evidencia de que se mantiene el mismo resultado**

| Métrica final | Original | Paralelizado |
|---|---|---|
| Iteraciones | 45 | 45 |
| profile_score | 0.01847086 | 0.01847086 |
| coverage | 96.94% | 96.94% |
| Transform recuperado (theta) | -18.00595° | -18.00595° |
| Transform recuperado (tx, ty) | (-1720.41, 1781.98) | (-1720.41, 1781.98) |

## Conclusión

La hipótesis fue corroborada. El tiempo de ejecución real se redujo cerca del 50 % (de unos 30 segundos a alrededor de 15 segundos, lo cual fue verificado tanto por perf stat como por time) al paralelizar nearest_neighbor_distances con OpenMP, sin que el resultado numérico del algoritmo se modificara: los dos tipos alcanzaron la misma convergencia en 45 iteraciones, con el mismo coverage (96.94 %) y profile_score (0.01847086).

El mecanismo que sustenta la mejora está respaldado por el evidenciado de perf stat: el total de instrucciones ejecutadas se mantuvo casi igual entre las dos versiones (+0.4%), mientras que la cantidad de CPUs empleadas aumentó de 1.0 a 3.432. Esto corrobora que el aumento del rendimiento se debió únicamente a la repartición del trabajo existente entre varios núcleos, no a una disminución real de la cantidad de trabajo realizado, lo cual valida la premisa inicial de la hipótesis: que las llamadas a GridIndex::nearest() dentro del bucle eran independientes y podían ser distribuidas entre hilos sin peligro.

La única conclusión inesperada fue un overhead medible de OpenMP (~12% de las muestras en gperftools, debido a omp_get_num_procs), el cual no contradice la hipótesis, pero plantea una posibilidad más para optimizar: establecer el número de hilos solo al comienzo del programa en vez de recalcularlo con cada llamada.



