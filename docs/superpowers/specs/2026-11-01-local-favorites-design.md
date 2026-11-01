# Persistencia local para el piloto

Base: main ec406138f7bee9ef2e5c1cd989655ee85a024358. Autoría independiente.
El usuario delegó decisiones y ejecución sin confirmaciones rutinarias; minitests pausados.

## Descubrimiento
AGENTS.md declara main canónica. main usa Set<String> en memoria; tres microlecciones originales. Las referencias a develop/Riverpod en documentos históricos no describen esta base.
El 1 noviembre 2026 la URL publicada respondió HTTP 200 y mostró las tres tarjetas. El recorrido y sus evidencias se registran en PILOT_VALIDATION.md.

## Alternativas y decisión del implementador
- Memoria: cero dependencias, pierde favoritos al recargar; incumple objetivo.
- API web directa: sin paquete, acopla app al navegador y requiere adaptadores para pruebas VM.
- shared_preferences: almacenamiento local multiplataforma, mantenido en el ecosistema Flutter; una dependencia, sin servicio ni coste recurrente. Elegida por el implementador bajo la delegación del usuario.
No hay backend, identidad ni sincronización. No almacenar secretos. El navegador puede borrar datos y el modo privado limita duración; no prometer durabilidad de base de datos.

## Contrato y fallos
Guardar IDs en una clave versionada; restaurar antes de habilitar guardado. Confirmar UI tras escritura satisfactoria, serializar mediante botón deshabilitado durante escritura. Si falla lectura, avisar y bloquear guardado para evitar sobrescribir datos desconocidos; si falla escritura conservar estado anterior y permitir reintentar. Descartar IDs desconocidos en lectura; no borrar otras preferencias.
Biblioteca informa del alcance local. Eliminar también persiste. No cambiar Repasar/Perfil.

## Aceptación y costes
Prueba de recreación completa de app restaura guardado; eliminación sobrevive recreación; datos ausentes/corruptos y fallos no bloquean navegación ni simulan éxito. Analyze/test/build ejecutados antes de marcar listo. EUR 0/mes adicionales, sin llamadas IA. CI y build consumen recursos existentes.
Rollback: revertir PR; la clave local queda inerte, sin migración destructiva. Publicación manual posterior con aprobación.
