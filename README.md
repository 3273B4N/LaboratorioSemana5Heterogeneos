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

## ¿Qué cambio de código intentaría primero?

Con base en el análisis del ensamblador, el primer cambio que intentaría sería cambiar la estructura de vecinos, ya que `GridIndex::nearest` es la región que concentra la mayor cantidad de tiempo. El problema principal no parece estar en una operación matemática específica, sino en la forma en que se accede a los datos. El bucle interno utiliza accesos indirectos mediante índices, por lo que la dirección de memoria que se necesita leer depende de datos obtenidos previamente. Esto dificulta que el procesador pueda anticipar las siguientes lecturas.

Las otras opciones tendrían una prioridad menor según los resultados obtenidos. La escritura de archivos y el renderizado no representan una parte importante del tiempo total, mientras que reducir cálculos de distancia tendría un impacto limitado, ya que `GridIndex::nearest` trabaja principalmente con distancias al cuadrado y evita realizar `sqrt` dentro de su bucle más caliente. De igual forma, paralelizar los bucles podría repartir el trabajo, pero no solucionaría el problema principal de los accesos indirectos a memoria.

Por esto, intentaría primero optimizar la estructura utilizada para realizar la búsqueda de vecinos. Una posibilidad concreta sería evitar reconstrucciones innecesarias del `GridIndex` del perfil objetivo. En `compare_profiles` se identificaron dos llamadas a `_Map_base::operator[]` relacionadas con la construcción de `GridIndex`. Como el perfil objetivo permanece constante durante las iteraciones del ICP, investigaría si este índice puede construirse una sola vez y reutilizarse.

La idea sería reducir el trabajo repetitivo sin modificar el resultado del algoritmo. Después de implementar el cambio, se debería comparar nuevamente el tiempo de ejecución y verificar que los resultados de `profile_metrics.csv` se mantengan iguales.
