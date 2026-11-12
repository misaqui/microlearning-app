# Catálogo 200 — diseño aprobado por alcance

## Descubrimiento
Base inspeccionada: develop accc77c. Flutter 3.35.5, shared_preferences,
tres fixtures en main.dart, sin backend. Render existente: sitio estático,
main, autoDeploy off. La petición del 12 de noviembre sustituye la política
anterior de rama única: implementación → PR develop → PR main validada.

## Alternativas y decisión
1. Cuerpos Dart embebidos: fácil al principio, difícil de revisar como datos.
2. JSON local empaquetado: elegido; una lectura asíncrona, ninguna petición
   a fuentes externas durante la lectura, revisión editorial independiente.
3. API/CMS: descartado para esta versión; añade coste y operación sin necesidad.

Estado Flutter SDK y preferencias locales existentes; sin gestor de estado
adicional. Lista lazy, búsqueda local tolerante a acentos, filtros por categoría,
detalle legible con atribución y enlace. Favorecer dos destinos útiles:
Descubrir y Biblioteca. Conservar IDs antiguos aunque no se muestren.

## Criterios de aceptación
- Exactamente 200 lecturas y cuotas de CONTENT_CATALOG_V1_200.md.
- 170–280 palabras reales, IDs/títulos únicos, español, estimación por palabras.
- Fuente específica, título verificado, evidencia de consulta individual.
- Textos originales, sin imágenes ajenas, revisión factual y de similitud.
- Pruebas de datos, búsqueda/filtros/detalle/atribución, favoritos y fallos.
- analyze/test/build y CI verdes para cada SHA candidato.
- Prueba de navegador sobre compilación candidata antes de main y tras Render.

## Coste y límites
Sin servicios nuevos ni inferencia en aplicación. Catálogo inferior a 1 MB
previsto; medir tamaño final. Favoritos por origen/navegador; no sincronización.
Lecturas de 1–2 minutos estimadas a 200 palabras/minuto, no tiempo garantizado.
Las comprobaciones automáticas no prueban por sí solas factualidad ni derechos.

## Publicación y reversión
Mantener Render main/manual. Publicación autorizada por esta petición sólo
después de pruebas y revisión. Registrar SHA, CI y deploy live. Revertir mediante
PR y volver a publicar SHA previamente validado; conservar preferencias.
