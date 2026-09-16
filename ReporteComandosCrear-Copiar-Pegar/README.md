# Práctica: Comandos de Creación, Copiado, Movimiento y Eliminación en Linux

Este repositorio contiene la evidencia completa, scripts de automatización, capturas de pantalla, material audiovisual y el reporte reflexivo correspondiente a la práctica de administración básica del sistema de archivos en GNU/Linux (Ubuntu).

---

## 1. Código y Scripts

* **Enlace al archivo:** [practica.sh](https://github.com/JuanAguilera144/Proyectos-SO/blob/main/ReporteComandosCrear-Copiar-Pegar/Codigo%20y%20Scripts/practica.sh)
* **Descripción:** Script desarrollado en Bash (`.sh`) debidamente comentado y estructurado. Automatiza de manera limpia y determinista todo el flujo de la práctica: creación de directorios (`mkdir`), generación de archivos de texto sin interfaz gráfica, inspección de metadatos (`ls -l`), copiado recursivo (`cp -r`) y eliminación controlada (`rm` / `rm -r`).

---

## 2. Terminal: Captura de Pantalla

* **Enlace a la evidencia:** [CapuraDeComandos.jpeg](https://github.com/JuanAguilera144/Proyectos-SO/blob/main/ReporteComandosCrear-Copiar-Pegar/Terminal/CapuraDeComandos.jpeg)
* **Descripción:** Evidencia gráfica de la ejecución de las instrucciones en la consola de comandos de Ubuntu. Muestra los comandos aplicados en tiempo real junto con las salidas generadas por el sistema operativo, validando la interacción y los cambios realizados en las rutas de trabajo.

![Captura de la Terminal](https://raw.githubusercontent.com/JuanAguilera144/Proyectos-SO/main/ReporteComandosCrear-Copiar-Pegar/Terminal/CapuraDeComandos.jpeg)

---

## 3. Video Demostrativo

* **Enlace al archivo con el URL:** [video.md](https://github.com/JuanAguilera144/Proyectos-SO/blob/main/ReporteComandosCrear-Copiar-Pegar/Video/video.md)
* **Descripción:** Archivo que aloja el enlace directo al video explicativo subido a YouTube. En dicha grabación se expone el procedimiento paso a paso, la verificación de los archivos creados y el comportamiento observado durante la ejecución de las operaciones en el sistema.

---

## 4. Reporte y Justificación Teórica

* **Enlace al documento:** [Analisis_Comportamiento_SO_Limpio.pdf](https://github.com/JuanAguilera144/Proyectos-SO/blob/main/ReporteComandosCrear-Copiar-Pegar/Reporte/Analisis_Comportamiento_SO_Limpio.pdf)
* **Descripción:** Documento formal en formato PDF que contiene el análisis reflexivo y la fundamentación teórica de la práctica. Explica cómo interactúa el sistema operativo a nivel de núcleo e inodos, por qué ocurre el conflicto al ejecutar editores gráficos con `sudo` (seguridad en Wayland frente a X11), el principio de menor privilegio y la diferencia entre la eliminación directa en terminal frente a la papelera visual.
