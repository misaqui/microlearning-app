# Flujo de trabajo — main como única rama permanente

Vigente desde el 2 de noviembre de 2026 por decisión expresa del propietario, que trabaja solo. Sustituye la política main/develop del 1 de noviembre.

## Trabajo diario
- main reúne el código del proyecto y es la rama predeterminada.
- Para cambios pequeños y de bajo riesgo, trabajar en main y validar antes de dar el cambio por terminado.
- Para cambios que necesitan aislamiento, usar una rama temporal y una PR directamente a main. Una vez integrada, eliminar la rama temporal.
- No mantener develop, ramas de promoción ni dos integraciones por cada mejora.

## Validación y publicación
GitHub Actions analiza, ejecuta pruebas y compila Flutter Web en PRs a main y en pushes a main. Revisar la CI del commit integrado. Las comprobaciones de navegador corresponden a la compilación exacta probada; registrar los límites.
Render sigue main, con autoDeploy off y publicación manual. Integrar código y publicarlo son acciones separadas.
No se añade una obligación de aprobación formal de otra persona para este proyecto individual. Las protecciones administrativas deben verificarse por separado; este documento no las configura.

## Migración y recuperación
Se preserva la historia de develop 8409ad44 y de favoritos 4cbd51ad en la integración hacia main. La eliminación de las referencias de rama se realiza después de integrar y comprobar la CI de main; no se descartan sus commits.
Para deshacer un cambio usar un commit de reversión en main. Si se publicó, desplegar manualmente una versión anterior aprobada. No reescribir la historia ni borrar las preferencias del navegador.
