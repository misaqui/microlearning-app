# Microlearning Hub

Prototipo Flutter Web con tres microlecciones originales, detalle y favoritos locales persistentes. Repasar y Perfil siguen pendientes; no hay backend, autenticación ni sincronización entre dispositivos.

## Trabajo individual
main es la única rama permanente. Cambios pequeños directamente en main; ramas temporales y PR a main cuando convenga aislar una mejora. No hay develop ni promoción entre ramas.
Ver [flujo de trabajo](docs/BRANCH_WORKFLOW.md).

## Validación
Flutter 3.35.5. GitHub Actions genera la plataforma web, respeta pubspec.lock y ejecuta análisis, pruebas y compilación.
Para un entorno con Flutter preparado:

```sh
flutter create --platforms=web --project-name microlearning_hub --no-pub .
flutter pub get --enforce-lockfile
flutter analyze --no-pub
flutter test --no-pub
flutter build web --release --no-pub
```

## Publicación
Render usa main, build `bash scripts/build-render-web.sh` y directorio `build/web`. El despliegue es manual y autoDeploy permanece desactivado. Integrar no publica automáticamente.
Ver [despliegue](docs/RENDER_DEPLOYMENT.md) y [evidencias](docs/PILOT_VALIDATION.md).

Los favoritos pertenecen al navegador/origen/perfil y pueden perderse al borrar sus datos. No guardar secretos. Consultar [procedencia](docs/UPSTREAM_PROVENANCE.md) antes de distribuir contenido derivado.
