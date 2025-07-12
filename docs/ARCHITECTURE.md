# FinanZen - Arquitectura del Proyecto

## 🏗️ Clean Architecture

Este proyecto implementa Clean Architecture para garantizar:
- **Separación de responsabilidades**
- **Independencia de frameworks**
- **Testabilidad**
- **Mantenibilidad**

## 📁 Estructura de Directorios

```
lib/
├── core/                    # Funcionalidades transversales
│   ├── constants/          # Constantes de la aplicación
│   ├── error/              # Manejo de errores y excepciones
│   ├── network/            # Configuración de red
│   ├── utils/              # Utilidades comunes
│   └── injection/          # Inyección de dependencias
├── data/                   # Capa de datos
│   ├── datasources/       
│   │   ├── local/         # Almacenamiento local (SQLite, SharedPreferences)
│   │   └── remote/        # APIs y servicios externos
│   ├── repositories/      # Implementaciones de repositories
│   └── models/            # Modelos de datos con serialización
├── domain/                 # Capa de dominio (Business Logic)
│   ├── entities/          # Entidades de negocio
│   ├── repositories/      # Contratos/interfaces de repositories
│   └── usecases/          # Casos de uso de la aplicación
└── presentation/           # Capa de presentación (UI)
    ├── features/          # Features organizadas por funcionalidad
    │   ├── auth/          # Autenticación
    │   │   ├── bloc/      # BLoC para auth
    │   │   └── ui/        # Pantallas de auth
    │   ├── dashboard/     # Dashboard principal
    │   │   ├── bloc/      # BLoC para dashboard
    │   │   └── ui/        # Pantallas de dashboard
    │   ├── transactions/  # Gestión de transacciones
    │   │   ├── bloc/      # BLoC para transacciones
    │   │   └── ui/        # Pantallas de transacciones
    │   └── analytics/     # Análisis y gráficas
    │       ├── bloc/      # BLoC para analytics
    │       └── ui/        # Pantallas de analytics
    ├── shared/            # Recursos compartidos
    │   ├── widgets/       # Widgets reutilizables
    │   ├── themes/        # Temas y estilos
    │   └── routes/        # Configuración de rutas
    └── core/              # Utilidades de presentación
```

## 📊 Flujo de Datos

```
UI (Widgets) → BLoC → Use Cases → Repository Interface → Repository Implementation → Data Source
```

## 🎯 Principios Aplicados

1. **Dependency Inversion**: Las capas internas no dependen de las externas
2. **Single Responsibility**: Cada clase tiene una única responsabilidad
3. **Interface Segregation**: Interfaces específicas para cada funcionalidad
4. **Separation of Concerns**: Cada capa tiene su propósito específico

## 🚀 Próximos Pasos

1. Implementar dependencias principales (freezed, bloc, dio)
2. Configurar inyección de dependencias con get_it
3. Desarrollar modelos y entidades de dominio
4. Implementar casos de uso principales
5. Crear pantallas y componentes UI
