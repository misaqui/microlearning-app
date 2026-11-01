# Registro de ejecución — favoritos locales

## Decisiones delegadas
- main ec406138 como base; clone nuevo aislado y rama fix/local-favorites. No se tocó develop.
- shared_preferences elegido por el implementador: una dependencia, sin backend ni coste recurrente; almacenamiento best-effort del navegador.
- El usuario excluyó confirmaciones rutinarias: diseño y plan escritos y ejecución directa. No se atribuye aprobación individual de cada decisión.
- Revisión de seguridad bloqueó arranque Flutter local por acceso al endpoint de metadatos. No se eludió; ejecución de gates en GitHub Actions.
- CI alineada con Flutter 3.35.5 de Render. La primera prueba roja usó el stable que ya tenía CI; se fijó versión para validación final.

## Evidencia y disciplina
- Descubrimiento: AGENTS y docs leídos; recorrido publicado observado visualmente y semánticamente; pérdida tras recarga reproducida.
- Regresión principal RED: 0c429c9, run 41290105271, analyze limpio, 3 pruebas existentes pasan, nueva falla por favorito ausente tras recrear app. Build omitido por fallo de test.
- Implementación inicial 68e578c: analyze limpio, regresión de persistencia pasa; suite 8 pasan/2 fallan por selector de test exacto FilledButton que no incluye subclase de FilledButton.icon. Corregido selector por tipo compatible, sin alterar producto para satisfacer el test.
- Pruebas auxiliares de errores y almacenamiento añadidas tras implementación: no se observó fase RED individual para estas. Esta es una limitación del seguimiento estricto de TDD, no afirmar que todas tuvieron RED→GREEN.
- Revisión independiente completa: importante carrera de escrituras al cambiar detalle; menor prueba de reinicio conserva caché del plugin. Añadido test de carrera antes de corregir y reload de almacenamiento en regresión principal.

## Límites
Sin sincronización entre pestañas/dispositivos, backup, login, backend, IA ni servicios de pago. Las pruebas usan plataforma de preferencias simulada; no equivalen a un navegador real con la versión nueva. QA móvil y navegador real del cambio requieren publicación posterior aprobada o preview.

## Cierre
PR #3. Resultados del SHA final y revisión en la descripción. No merge ni deploy realizados. Rollback: revertir PR; datos locales no se borran automáticamente.

- RED carrera confirmado: 8b887f2, run 41290395333, 10 pasan/1 falla: segundo detalle permite escritura durante la anterior (onPressed no es null).
- Corrección: ValueNotifier global de escritura pendiente, todos los detalles escuchan su estado; dispose y mounted protegen finalización. Cambiar de ruta mantiene navegación, pero bloquea otra escritura hasta terminar la anterior.
- Hallazgo menor caché: corregido reload en prueba principal; eliminación y reapertura UI verificadas con store inyectado. No equivale a prueba web real.
