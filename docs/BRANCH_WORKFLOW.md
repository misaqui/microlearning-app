# Flujo de trabajo — develop y versiones validadas

Vigente por petición expresa del propietario el 12 de noviembre de 2026.
Sustituye la política de rama única del 2 de noviembre.

1. Crear ramas temporales desde develop y abrir PR hacia develop.
2. Validar análisis Flutter, pruebas, catálogo y build web con Actions.
3. Revisar el candidato exacto en navegador y abrir PR develop → main.
4. Comprobar también CI del SHA integrado en main.
5. Publicar manualmente en Render sólo cuando la versión sea apta y esté autorizada.

Render sigue main con autoDeploy off. Integración y publicación son operaciones
separadas. Las protecciones administrativas no se dan por configuradas.
Revertir mediante commits/PR, sin reescribir historia ni borrar preferencias.
