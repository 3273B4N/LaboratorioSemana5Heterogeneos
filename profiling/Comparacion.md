# Comparación de herramientas de profiling 

## Tabla comparativa: hotspot principal por herramienta

| Herramienta | Configuración | % en GridIndex::nearest | Referencia |
|---|---|---|---|
| perf (perf report) | sin --export | 73.78% (children/self) | - |
| perf (perf report, cpu-core) | con --export | 97.88% (self) | - |
| gperftools | sin --export | 73.9% | 2,844 samples totales |
| gperftools | con --export | 66.4% | 3,338 samples totales (+17.4%) |
| Valgrind Callgrind | sin --export | 83.40% | 203,397,705,129 instrucciones (Ir) |
| Valgrind Callgrind | con --export | 70.71% | 239,891,504,097 instrucciones (Ir) (+17.9%)|

## Datos generales de perf stat 

| Métrica | Sin --export | Con --export |
|---|---|---|
| Tiempo total (elapsed) | 23.80 s | 25.36 s |
| Tiempo de sistema (sys) | 0.064 s | 0.184 s (~3x, por I/O de exportación) |
| Instrucciones (cpu_core) | 210,387,090,017 | 238,232,632,909 |
| Backend bound (cpu_core) | 39.4% | 37.5% |

## ¿Cuáles funciones aparecen como hotspots en cada herramienta?

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

## ¿Los resultados coinciden entre perf, Google Performance Tools y Valgrind? Explique las diferencias.

Sí, las tres herramientas concuerdan en que `GridIndex::nearest` es el hotspot más dominante del programa, aunque con porcentajes diferentes (de 66 % a 97 %, dependiendo de la herramienta y de la configuración). Las diferencias se deben a cómo se mide cada una: perf emplea muestreo estadístico por eventos de hardware, con interrupciones periódicas del CPU, y es sensible al tipo de núcleo en el que corre (cpu-core reportó 97.88% self mientras que cpu-atom reportó 73.78%, para la misma ejecución). Gperftools también emplea el muestreo, aunque lo hace a través de señales temporales, con un overhead más bajo que Valgrind, pero una precisión inferior a la de un conteo exhaustivo. Por otro lado, Valgrind Callgrind simula el programa entero e instrumenta cada instrucción que se ejecuta, lo que proporciona la contabilización más precisa y exhaustiva de las tres (83.40% sin --export), ya que no se basa en muestreo sino en un conteo real de instrucciones. Las tres concuerdan además en el mecanismo interno del cuello de botella: el costo se concentra en las operaciones de hashtable (`_M_find_node`, `_M_find_before_node`, `_M_bucket_index`), que emplean `GridIndex::nearest` para localizar puntos por celda. 

## ¿Qué costo tiene exportar los archivos de reconstrucción?

Las tres herramientas concuerdan en que la exportación supone un costo adicional real, aunque sea secundario en comparación con el costo del algoritmo de emparejamiento. Con perf, el tiempo total aumentó de 23.80s a 25.36s (+6.5%), y el tiempo del sistema casi se triplicó (0.064s → 0.184s) a causa del I/O de escritura en disco. Con gperftools, el número total de muestras aumentó de 2,844 a 3,338 (un incremento del 17.4%), con la introducción de nuevas funciones como `export_reconstruction` (10.4%) y `write_cloud_csv` (9.5%), así como trabajo de formateo de números en texto (`printf_fp`, `num_put`). Con Valgrind, las instrucciones anotadas aumentaron de cerca de 203.4 a 239.9 mil millones, lo que representa un incremento del 17.9%. En la versión con exportación, la llamada a `write_cloud_csv` desde `export_reconstruction` acumuló 12.14% del total de instrucciones, correspondiente a sus 29 invocaciones dentro del ciclo de exportación de frames, aunque el costo propio de la función por sí sola es menor.

## ¿Qué herramienta le dio la evidencia más clara para decidir dónde optimizar?

Valgrind Callgrind proporcionó la evidencia más exacta y accionable porque mide instrucciones precisas en lugar de apoyarse en el muestreo, y posibilita observar, línea por línea, las operaciones que dentro de `GridIndex::nearest` requieren más ciclos. Por ejemplo, el cálculo de distancia al cuadrado (`ex*ex + ey*ey`) y la iteración de puntos dentro de cada celda representan entre el 12% y el 15% del total de instrucciones. Perf y gperftools fueron capaces de determinar con rapidez cuál era la función principal que constituía el hotspot, sin requerir el nivel de detalle línea por línea que proporciona Valgrind; además, su ejecución fue más rápida. Para un diagnóstico inicial, perf y gperftools son más útiles; Valgrind proporciona la evidencia más exacta y fiable para determinar con precisión qué línea de código abordar primero.
