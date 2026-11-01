# Evidencia del piloto — 1 noviembre 2026

## Versión publicada observada
URL: https://microlearning-hub.onrender.com/
HTTP 200; Last-Modified 24 octubre 2026 21:53:38 UTC. main permanece en ec406138f7bee9ef2e5c1cd989655ee85a024358. La cabecera HTTP no demuestra por sí sola el SHA publicado.

Comprobación real mediante navegador remoto, captura visual y árbol de accesibilidad:
1. Descubrir: tres microlecciones originales visibles.
2. Abrir «La atención es un recurso limitado»: detalle, lectura y botón Guardar visibles.
3. Guardar: el botón cambia a «Quitar de Biblioteca».
4. Volver y abrir Biblioteca: aparece únicamente la microlección guardada.
5. Recargar y volver a Biblioteca: «Todavía no tienes ideas guardadas…»; pérdida reproducida.
Esta evidencia corresponde al despliegue existente, no a la nueva implementación. No hay verificación móvil ni cross-browser.

## Validación del cambio
La instalación/ejecución local de Flutter fue rechazada por revisión automática: intento de acceso al endpoint de metadatos 169.254.169.254. No se repitió ni se eludió. Se utiliza GitHub Actions para ejecución de analyze/test/build; los resultados se enlazan en la PR. No presentar comandos locales como aprobados.

## Despliegue y rollback
PR a main, revisión, merge y aprobación explícita antes del deploy manual en workspace microlearning. AutoDeploy continúa off según configuración aportada. Tras publicar: guardar dos ideas, recargar, quitar una, recargar, cerrar/reabrir navegador y verificar. No cambiar origen/dominio durante prueba: almacenamiento se limita al origen y perfil. Revertir PR y desplegar versión anterior revierte funcionalidad sin borrar otras preferencias.
