## 1. Tipos de Kernel y sus diferencias

El kernel es el núcleo del sistema operativo y actúa como un puente entre las aplicaciones y el hardware. Existen varios tipos de kernels, cada uno con características específicas:

* Monolithic Kernel:

    * Todo el código del kernel (gestión de memoria, gestión de procesos, sistema de archivos, etc.) se ejecuta en el mismo espacio de memoria, lo que permite una comunicación rápida entre sus componentes.
    * Ejemplo: Linux, Unix.
    * Ventajas: Desempeño alto debido a la comunicación directa entre componentes.
    * Desventajas: Dificultad para depurar y mantener debido a la gran cantidad de código en un solo espacio.

* Microkernel:

    * Se encarga solo de las funciones más básicas del sistema (como la comunicación entre procesos y la gestión básica de hardware), dejando otros servicios al espacio de usuario.
    * Ejemplo: Minix, QNX.
    * Ventajas: Mayor estabilidad y seguridad, ya que la mayoría de los servicios se ejecutan en espacio de usuario.
    * Desventajas: Desempeño más bajo debido a la sobrecarga de comunicación entre los servicios en diferentes espacios de memoria.

* Hybrid Kernel:

    * Combina aspectos de los kernels monolíticos y microkernels. Aunque se parece más a un monolithic kernel, intenta modularizar ciertos servicios en espacio de usuario.
    * Ejemplo: Windows NT, macOS.
    * Ventajas: Balance entre desempeño y modularidad.
    * Desventajas: Complejidad en su diseño y mantenimiento

* Exokernel:

    * Delega la mayor parte de la gestión a las aplicaciones, permitiendo un mayor control y personalización por parte de los desarrolladores.
    * Ejemplo: No tiene muchos ejemplos comerciales conocidos, pero existen prototipos académicos.
    * Ventajas: Flexibilidad extrema y posibilidad de optimización a medida.
    * Desventajas: Difícil de programar y asegurar, ya que las aplicaciones necesitan manejar más aspectos de la gestión de recursos.

## 2. User Mode vs Kernel Mode

Estos son dos modos de operación en los que puede ejecutarse el código en un sistema operativo:

* Kernel Mode (Modo Kernel):
    * Es el modo en el que se ejecuta el código del kernel y tiene acceso completo a todos los recursos del sistema, incluyendo el hardware.
    * Cualquier instrucción puede ejecutarse y cualquier operación de hardware puede realizarse.
    * Los errores en el código que se ejecuta en kernel mode pueden provocar un fallo total del sistema (crash).

* User Mode (Modo Usuario):
    * Es el modo en el que se ejecutan las aplicaciones y los procesos de usuario. Tiene un acceso limitado a los recursos del sistema y no puede interactuar directamente con el hardware.
    * Si un programa en user mode falla, solo afectará al programa en cuestión y no al sistema operativo en general.
    * Para realizar operaciones que requieren acceso a hardware o memoria crítica, el código en user mode debe realizar una llamada al sistema (system call) para que el kernel ejecute la operación en su nombre.

## 3. Interrupts vs Traps

Las interrupciones y traps son mecanismos mediante los cuales un sistema operativo maneja eventos que requieren atención inmediata:

* Interruptions (Interrupciones):

    * Son señales enviadas por el hardware (como dispositivos de entrada/salida) al procesador para indicar que se requiere atención inmediata.
    * Ejemplo: Cuando se presiona una tecla, el teclado genera una interrupción que indica al procesador que debe leer el valor de la tecla.
    * Características:
        * Pueden ocurrir en cualquier momento.
        * Son asíncronas, ya que no dependen de la ejecución del programa.
        * Detienen temporalmente la ejecución del proceso actual para atender el evento y luego se reanuda la ejecución del proceso donde se había detenido.

* Traps:

    * Son interrupciones generadas por el software, normalmente para ejecutar un servicio del sistema operativo o manejar errores.
    * Ejemplo: Una división por cero en un programa podría generar un trap que se maneje mediante una rutina específica en el kernel.
    * Características:
        * Son síncronas, ya que ocurren como resultado de la ejecución de una instrucción específica.
        * Generalmente se utilizan para manejar excepciones o realizar llamadas al sistema (system calls).
        * El control se transfiere al kernel, que decide cómo manejar la situación antes de devolver el control al programa en user mode.
