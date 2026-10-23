# Primera funcionalidad: Descubrir → Biblioteca

## Resultado
Microlecciones locales originales disponibles en Descubrir. Al pulsar una tarjeta se abre la vista de detalle. Desde ella se puede guardar o quitar una idea de Biblioteca; Biblioteca muestra únicamente las guardadas.

## Criterios de aceptación
- Descubrir ofrece tres ejemplos locales independientes de cualquier contenido heredado.
- El detalle presenta título, categoría, lectura y botón de guardado reversible.
- Biblioteca muestra lo guardado o un estado vacío comprensible.
- Existen pruebas de recorrido principal, estado vacío y eliminación.
- No se añade backend, autenticación, analítica ni gasto recurrente.

## Limitación intencionada
El guardado vive solo en memoria durante la sesión de la aplicación. Se pierde al recargar el navegador. Persistencia local y sincronización se evaluarán en otra fase.

## Aprendizaje
**Vertical slice**: recorrido de usuario completo, de extremo a extremo, con alcance pequeño y verificable.
