# Primera funcionalidad: Descubrir → Biblioteca

## Resultado
Microlecciones locales originales disponibles en Descubrir. Al pulsar una tarjeta se abre la vista de detalle. Desde ella se puede guardar o quitar una idea de Biblioteca; Biblioteca muestra únicamente las guardadas.

## Criterios de aceptación
- Descubrir ofrece tres ejemplos locales independientes de cualquier contenido heredado.
- El detalle presenta título, categoría, lectura y botón de guardado reversible.
- Biblioteca muestra lo guardado o un estado vacío comprensible.
- Existen pruebas de recorrido principal, estado vacío y eliminación.
- No se añade backend, autenticación, analítica ni gasto recurrente.

## Persistencia local (cambio preparado para el piloto)
Los IDs se guardan con shared_preferences bajo una clave versionada. Se recuperan al iniciar y se eliminan de forma persistente al quitarlos de Biblioteca. El alcance es este navegador/origen/perfil; no hay sincronización ni garantía frente al borrado de datos. Un fallo de lectura bloquea escrituras; un fallo de escritura conserva el estado visible y permite reintentar. Ver PILOT_VALIDATION.md y la PR para estado de validación/publicación.

## Aprendizaje
**Vertical slice**: recorrido de usuario completo, de extremo a extremo, con alcance pequeño y verificable.
