# Evidencia del piloto

## Candidato de favoritos corregido — 2 noviembre 2026
- Head 4cbd51ad48bc01e107eecaca9a07622c40bcbd9a; combinación probada 085916d60ef0547018b96e445183a325dc4ef3f8 contra develop 8409ad44 (rama usada antes de la simplificación).
- CI GREEN: https://github.com/misaqui/microlearning-app/actions/runs/41537349500 — análisis sin incidencias, 13 pruebas aprobadas y compilación web correcta.
- Regresión RED previa: https://github.com/misaqui/microlearning-app/actions/runs/41537073517 — dos activaciones antes de redibujar iniciaban dos escrituras en lugar de una; 12 pruebas pasaron y esa prueba falló.
- Corrección: bloqueo síncrono antes de empezar a guardar. Revisión independiente sin nuevos bloqueantes.
- Artifact de GREEN verificado por SHA-256 4476fcc1a487ecde687da88395f2bef0fad0f91dfa8771a7acf4fbf15064ef3c; servido localmente en un origen nuevo: abrir, guardar, recargar y recuperar desde Biblioteca, correcto.
- En el candidato previo 3465327 se comprobaron dos guardados, eliminación persistente y cierre/reapertura de pestaña. Esa evidencia es histórica.
- Sin prueba manual móvil, entre navegadores o de errores reales de almacenamiento. La concurrencia se verificó por prueba automatizada, no por doble clic manual.
- La nueva migración de política necesita su propia CI antes de integrarse, y CI sobre main tras integrar. No atribuir estos resultados a commits posteriores sin verificarlos.

## Versión publicada observada — evidencia histórica
URL: https://microlearning-hub.onrender.com/
HTTP 200; Last-Modified 24 octubre 2026 21:53:38 UTC. El commit publicado observado era ec406138f7bee9ef2e5c1cd989655ee85a024358. La cabecera HTTP no demuestra por sí sola el SHA publicado.

Comprobación real mediante navegador remoto, captura visual y árbol de accesibilidad:
1. Descubrir: tres microlecciones originales visibles.
2. Abrir «La atención es un recurso limitado»: detalle, lectura y botón Guardar visibles.
3. Guardar: el botón cambia a «Quitar de Biblioteca».
4. Volver y abrir Biblioteca: aparece únicamente la microlección guardada.
5. Recargar y volver a Biblioteca: «Todavía no tienes ideas guardadas…»; pérdida reproducida.
Esta evidencia corresponde al despliegue existente, no a la nueva implementación. No hay verificación móvil ni cross-browser.



## Ejecución y publicación
Flutter analyze/test/build se ejecutó en GitHub Actions; no se afirma ejecución local de Flutter. El navegador local sirvió únicamente la compilación ya generada por CI.
Flujo vigente: main y ramas temporales cuando ayuden; sin develop. Render sigue main con autoDeploy off. Integrar código no lo publica.
Antes de desplegar manualmente, validar el commit exacto; después comprobar guardar dos ideas/recargar/quitar una/recargar. No cambiar de origen durante la prueba.
Rollback mediante reversión en main y publicación manual de una versión aprobada, sin borrar preferencias ajenas.
