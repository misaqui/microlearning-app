# Catálogo editorial v1 — 200 microlecturas (opción C)

Estado: OBJETIVO APROBADO; **no confundir con 200 textos completados/verificados**.
Fecha: 2026-11-12.

## Alcance
200 lecturas ORIGINALES en español, 1–2 minutos (objetivo 170–280 palabras, con estimación por recuento real).
150 (75 %) curiosidad y entretenimiento; 50 (25 %) tecnología y carrera.
No copiar artículos de terceros. Un enlace verificable, fuente, fecha de consulta y referencia para cada ficha.
No usar una URL genérica como si respaldara hechos específicos.
No rellenar cupos con paráfrasis repetitivas ni generar 200 piezas de un único artículo.

## Cuotas
- Universo, astronomía y exploración: 25
- Naturaleza, animales y evolución: 25
- Historia y civilizaciones: 25
- Psicología y comportamiento: 25
- Ciencia cotidiana, salud general y física: 20
- Economía, sociedad y datos sorprendentes: 15
- Arte, cultura, idiomas y viajes: 15
- IA aplicada y futuro tecnológico: 20
- Ingeniería, arquitectura y seguridad: 15
- Liderazgo, pensamiento crítico y aprendizaje: 15

Total: 200; curiosidad 150; profesional 50.

## Esquema de contenido esperado
```json
{
  "id": "slug-estable",
  "title": "Titular original",
  "category": "Naturaleza",
  "summary": "Una frase",
  "body": "Texto original de 170–280 palabras",
  "source_name": "Organización o autor",
  "source_title": "Título original verificado",
  "source_url": "https://...",
  "checked_at": "YYYY-MM-DD",
  "language": "es",
  "word_count": 200,
  "reading_minutes": 2
}
```

## Fuentes candidatas (no constituyen 200 verificaciones)
- NASA Science — https://science.nasa.gov/
- Smithsonian — https://www.smithsonianmag.com/
- Our World in Data — https://ourworldindata.org/
- Natural History Museum — https://www.nhm.ac.uk/
- National Geographic — https://www.nationalgeographic.com/
- CERN — https://home.cern/
- ESA — https://www.esa.int/
- NOAA — https://www.noaa.gov/
- British Museum — https://www.britishmuseum.org/
- Google SRE — https://sre.google/resources/
- Cloudflare Blog — https://blog.cloudflare.com/
- Google DeepMind — https://deepmind.google/discover/blog/
- OpenAI — https://openai.com/news/

## Calidad y derechos
1. Obtener el artículo origen y corroborar que existe, su título exacto y que sustenta las afirmaciones.
2. Redactar una lectura original y útil, sin copiar textos largos ni imágenes no licenciadas.
3. Revisar factualidad (datos, unidades, cronología, grado de certeza), redacción española, no duplicidad.
4. Calcular el tiempo por palabras (no asignar dos minutos por defecto).
5. Validación automática: exactamente 200 registros, IDs y títulos únicos, URLs HTTPS, source metadata completa, 170–280 palabras, 150/50 por categorías.
6. Integrar en Flutter Web sin llamadas externas en tiempo de lectura; preservar IDs de favoritos existentes.
7. Ejecutar flutter analyze, flutter test, flutter build web en CI para el SHA exacto y revisar experiencia Discover/Biblioteca.
8. No promover a main ni desplegar en Render hasta pruebas y revisión.

## Observación del repositorio (2026-11-12)
main contiene tres microlecciones locales en lib/main.dart, no usa aún un catálogo JSON.
develop no existía al comienzo de la inspección y fue creada desde main.
README.md documenta despliegue Render manual desde main; no atribuir publicación a commits en develop.

## Criterio de terminación
Solo marcar listo cuando existan 200 cuerpos originales completos y fuentes individualmente contrastadas, y la aplicación los muestre con CI verificada. Este documento **no** cumple por sí solo ese criterio.
