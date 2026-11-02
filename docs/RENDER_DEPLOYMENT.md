# Render: publicación manual desde main

Workspace microlearning (tea-dbd9mji9lscs73ao01j0), static service srv-dbeih10m7kps73e0nb90. No usar padel.

Repositorio misaqui/microlearning-app; rama main; build `bash scripts/build-render-web.sh`; directorio publicado `build/web`; autoDeploy off.
Esta configuración se observó en Render el 2 de noviembre de 2026. Verificarla de nuevo antes de publicar. No hay que cambiar la rama alojada para eliminar develop.

## Código y versión publicada
main contiene la integración del proyecto; que un cambio llegue a main no significa que esté publicado.
En la auditoría, Render tenía como último despliegue live el commit ec406138 del 24 de octubre. La migración de ramas no autoriza ni realiza un despliegue.
La implementación incluye favoritos locales y dependencia bloqueada; no hay backend, login, ingestión ni llamadas IA. Ver UPSTREAM_PROVENANCE.md para límites de procedencia.

## Publicar cuando se solicite
1. Identificar el SHA exacto de main y exigir CI correcta: análisis, pruebas y compilación.
2. Confirmar rama main, autoDeploy off y comando de build; ejecutar el despliegue manual autorizado y seguirlo hasta live.
3. Comprobar el SHA publicado y probar Descubrir, detalle, guardado, Biblioteca y recarga. Quitar una idea y comprobar que la eliminación persiste.
4. Registrar límites de dispositivo/navegador; CI no sustituye la prueba funcional.

Flutter 3.35.5; generación de scaffolding con --no-pub, resolución con --enforce-lockfile y análisis/pruebas/build sin nueva resolución.

Rollback: revertir el cambio en main o publicar manualmente la versión anterior aprobada, comprobando el SHA final. No borrar preferencias ajenas.
