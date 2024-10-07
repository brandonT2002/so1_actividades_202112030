# **Completely Fair Scheduler (CFS)**

## Características

1. Equidad (Fairness): El principio básico del CFS es asignar tiempo de CPU de manera justa entre todos los procesos. Intenta asegurarse de que todos los procesos obtengan una porción del tiempo de CPU proporcional a su prioridad, sin darle demasiada ventaja a procesos de alta prioridad ni perjudicar a los de baja prioridad.

2. Planificación basada en tiempo virtual (Virtual Runtime): El CFS utiliza el concepto de tiempo virtual (virtual runtime) para medir cuánto tiempo de CPU ha recibido cada proceso. El tiempo virtual es ajustado en función de la prioridad del proceso, es decir, los procesos de baja prioridad acumulan tiempo virtual más rápido, lo que les hace ser penalizados en la asignación de CPU, mientras que los de alta prioridad lo acumulan más lentamente.

3. Cola de Red-Black Tree (Árbol Rojo-Negro): El CFS utiliza una estructura de datos eficiente llamada Red-Black Tree (árbol rojo-negro) para mantener el estado de los procesos que están listos para ejecutarse. Cada nodo en el árbol representa un proceso, y los nodos están organizados en función de su tiempo virtual. Esto permite que la selección del próximo proceso a ejecutarse sea eficiente, ya que el proceso con el menor tiempo virtual siempre está en la raíz del árbol y puede ser seleccionado en tiempo O(log n).

4. Prioridades ajustables (Nice Values): El CFS respeta el valor de nice de cada proceso, que ajusta la prioridad de los procesos en Linux. Un valor nice más bajo significa mayor prioridad y tiempo de CPU más frecuente, mientras que un valor nice más alto significa menor prioridad y menos tiempo de CPU.

5. Granularidad: El CFS introduce el concepto de granularidad de tiempo para evitar cambiar de proceso con demasiada frecuencia (lo que introduce sobrecarga). Es decir, el CFS evita el "context switching" (cambio de contexto) excesivo, definiendo intervalos mínimos de tiempo entre estos cambios.

6. Soporte para Multinúcleo: El CFS está diseñado para funcionar eficientemente en sistemas multinúcleo, equilibrando la carga entre los distintos núcleos para evitar que un núcleo esté saturado mientras otro permanece inactivo.

7. Latencia de tareas: Una característica importante del CFS es que garantiza que todos los procesos en ejecución sean planificados al menos una vez en un intervalo de tiempo razonable, lo que mejora la latencia de las tareas interactivas. Esto es importante para procesos interactivos como interfaces gráficas de usuario o aplicaciones que requieren una rápida respuesta.

# Funcionalidad

1. Medición del Tiempo Virtual: Cada proceso tiene un tiempo de ejecución virtual (vruntime), que representa cuánto tiempo de CPU ha recibido en relación con otros procesos. Los procesos con menor vruntime tienen mayor prioridad para ejecutarse. Cada vez que un proceso se ejecuta, su vruntime aumenta. Cuanto mayor sea su prioridad (menor valor de nice), más lento se incrementa su vruntime.

2. Selección del proceso a ejecutar: El CFS organiza los procesos listos para ejecutarse en el árbol rojo-negro. Este árbol está ordenado por el vruntime de los procesos, de modo que el proceso con el menor vruntime siempre está en la raíz del árbol. Cuando el planificador debe seleccionar un nuevo proceso, simplemente selecciona el que está en la raíz del árbol (el de menor vruntime), lo que garantiza que el proceso que ha recibido menos tiempo de CPU sea el siguiente en ejecutarse.

3. Asignación de tiempo de CPU: El CFS asigna un cuanto de tiempo a cada proceso, es decir, la cantidad de tiempo que puede ejecutarse antes de que otro proceso tenga su turno. El cuanto de tiempo se ajusta en función de la prioridad del proceso, asegurando que los procesos de mayor prioridad reciban más tiempo de CPU que los de menor prioridad.

4. Actualización del árbol: Cuando un proceso es seleccionado para ejecutarse, su vruntime comienza a acumularse. Cuando termina su cuanto de tiempo, se actualiza su vruntime en el árbol rojo-negro, y el árbol se reordena. Luego, el planificador selecciona el próximo proceso en la raíz del árbol (el proceso con el menor vruntime restante).

5. Interacción con la política nice: Los valores nice ajustan la velocidad a la que el vruntime de un proceso aumenta. Los procesos con un valor nice bajo (mayor prioridad) acumulan vruntime más lentamente, por lo que permanecen en la raíz del árbol por más tiempo, dándoles más tiempo de CPU. Los procesos con un valor nice alto acumulan vruntime más rápidamente, siendo despriorizados antes.