---
applyTo: '**'
---
Cada vez que comiences a trabajar en una issue nueva quiero que generes una nueva rama con un nombre asociado al propósito de la issue a partir de la rama `develop`.

Por ejemplo, si la issue es "Añadir autenticación de usuario", la rama debería llamarse `feature/authentication-user`.

Quiero que uses git flow como convención de nombres para las ramas. Aquí tienes un resumen de las convenciones:

- `feature/` para nuevas características
- `bugfix/` para corrección de errores
- `hotfix/` para correcciones críticas en producción
- `release/` para preparar una nueva versión
- `chore/` para tareas de mantenimiento o configuración

Quiero que los commits tengan un mensaje descriptivo pero corto (menos de 50 caracteres) y que sigan la convención de mensajes de commit de Angular:
- `feat:` para nuevas características
- `fix:` para correcciones de errores
- `docs:` para cambios en la documentación
- `style:` para cambios de estilo (formato, espacios, etc.)
- `refactor:` para cambios de código que no afectan el comportamiento
- `perf:` para mejoras de rendimiento
- `test:` para añadir o corregir pruebas

Al final de cada trabajo con una issue, quiero que hagas un pull request a la rama `develop` con un título descriptivo y una descripción clara siguiendo la plantilla que encontrarás en `.github/PULL_REQUEST_TEMPLATE.md`.

