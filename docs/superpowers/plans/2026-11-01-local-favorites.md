# Favoritos locales — Implementation Plan

> **For agentic workers:** usar superpowers:executing-plans; ejecución directa delegada por usuario.

**Goal:** conservar favoritos entre reinicios sin backend.
**Architecture:** adaptador FavoriteStore y estado Flutter con escrituras confirmadas.
**Tech Stack:** Flutter 3.35.5 y shared_preferences.
**Global Constraints:** main canónica; autoría independiente; EUR 0/mes adicional; no deploy automático.

Spec: ../specs/2026-11-01-local-favorites-design.md
Ejecución directa delegada por usuario, sin confirmaciones rutinarias.

1. Verificar baseline: Flutter 3.35.5 (igual Render), flutter pub get/test. Registrar evidencia publicada.
2. TDD: añadir widget test que guarda, destruye la app, vuelve a crearla y exige favorito en Biblioteca. Debe fallar en main por pérdida de estado. Añadir shared_preferences y un adaptador FavoriteStore con Future<Set<String>> load(), Future<void> save(Set<String> ids).
3. Implementar restauración asíncrona, escrituras confirmadas, loading/error y deshabilitar pulsaciones concurrentes. Añadir pruebas de borrado/restauración, lectura fallida, escritura fallida, datos inválidos e IDs desconocidos, antes de implementar cada rama.
4. Formatear, flutter analyze, flutter test, flutter build web. Revisar diff completo y riesgos. Actualizar documentación vigente para main y persistencia; mantener procedencia histórica. Commit y PR a main; no merge ni deploy.

Review Focus: no sobrescribir tras lectura fallida; no éxito falso en escritura; no setState tras dispose; botón no se queda bloqueado; plugin web compila. Fuera de alcance: sincronización entre pestañas/dispositivos, persistencia garantizada tras borrado del navegador, QA móvil exhaustiva.
