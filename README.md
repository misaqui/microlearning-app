# Microlearning Hub

Flutter Web: catálogo local de 200 microlecturas originales en español,
búsqueda y filtros en Descubrir, detalle con atribución y favoritos locales.
150 lecturas de curiosidad y 50 profesionales; fuentes específicas verificadas.

## Desarrollo
Ramas de implementación y PR a develop; promoción validada mediante PR a main.
Ver docs/BRANCH_WORKFLOW.md y docs/superpowers/specs/2026-11-12-catalog-design.md.

## Validación
Flutter 3.35.5. Ejecutar python3 scripts/validate_catalog.py, flutter analyze,
flutter test y flutter build web. GitHub Actions comprueba develop y main.

## Publicación
Render sigue main con autoDeploy off; publicación manual tras validación.
Los favoritos pertenecen al navegador/origen y no se sincronizan. Sin backend
ni llamadas IA en el producto. Evidencia editorial en docs/content_audit/.
