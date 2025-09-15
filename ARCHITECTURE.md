# Core App Architecture Documentation

## Overview

This Flutter application follows **Clean Architecture** principles with a simplified three-layer approach: **Core**, **Data-Domain**, and **Feature (Presentation)**. This architecture promotes separation of concerns, testability, and maintainability while skipping the traditional use case layer for simplicity.

## Architecture Layers

<img width="2635" height="1901" alt="architect" src="https://github.com/user-attachments/assets/79264a89-2e40-403d-a789-58d0816a45de" />


This diagram illustrates the three-layer architecture of our Flutter application, showing the relationships between the Core, Data-Domain, and Feature layers, along with their key components and data flow.

### 1. Core Layer (`/lib/src/shared/`)

The core layer contains shared components, utilities, and configurations that are used across the entire application.

#### Structure:
```
lib/src/shared/
├── assets/          # Generated assets (images, colors, fonts)
├── components/      # Reusable UI components
├── config/          # App configuration (DI, routing)
├── enum/           # Application enums
├── extensions/     # Dart extensions
├── l10n/          # Localization files
├── models/        # Shared models and base classes
├── network/       # Network configuration
├── services/      # Core services
└── utils/         # Utility classes and helpers
```

#### Key Components:
- **Dependency Injection**: Using `get_it` and `injectable` for service location
- **Routing**: Auto Route for navigation management
- **Base Models**: Result wrapper for error handling
- **Network**: Dio HTTP client configuration
- **Theme**: Material Design theme configuration

### 2. Data-Domain Layer (`/lib/src/data/`)

This layer handles data operations, business logic, and external API interactions. It combines the traditional data and domain layers for simplified architecture.

#### Structure:
```
lib/src/data/
├── datasources/    # Data source interfaces and implementations
├── models/         # Data models and DTOs
├── repositories/   # Repository interfaces and implementations
└── services/       # API services and data operations
```

#### Components:

**Data Sources:**
- **Abstract Data Source**: Defines contracts for data operations
- **Local Data Source**: Handles local storage (cache, preferences)
- **Remote Data Source**: Manages API calls and remote data fetching
- **Data Source Implementation**: Combines local and remote sources with fallback logic

**Repositories:**
- **Repository Interface**: Defines business operations
- **Repository Implementation**: Implements business logic and data transformation
- Uses the Result pattern for error handling

**Services:**
- **API Services**: Retrofit-based HTTP services
- **Path Definitions**: API endpoint constants

**Models:**
- **DTOs**: Data Transfer Objects with JSON serialization
- **Freezed Models**: Immutable data classes
- **Enums**: Type-safe constants

### 3. Feature (Presentation) Layer (`/lib/src/features/`)

This layer contains the UI and presentation logic, organized by features.

#### Structure:
```
lib/src/features/
├── pokelist/
│   ├── presentation/
│   │   ├── managers/    # BLoC state management
│   │   ├── pages/       # Screen widgets
│   │   └── widgets/     # Feature-specific widgets
│   └── pokelist.dart    # Feature barrel file
├── home_page.dart       # Home screen
└── root.dart           # Main navigation wrapper
```

#### Components:

**State Management:**
- **BLoC Pattern**: Using `flutter_bloc` for state management
- **Events**: User actions and system events
- **States**: UI state representations
- **BLoC**: Business logic controllers

**Pages:**
- Screen-level widgets
- Route configuration with Auto Route
- Scaffold and layout management

**Widgets:**
- Feature-specific reusable components
- Custom UI elements
- Presentation logic

## Key Libraries and Technologies

### State Management
- **flutter_bloc (^9.0.0)**: BLoC pattern implementation
- **freezed (^2.5.7)**: Immutable data classes and union types

### Dependency Injection
- **get_it (^8.0.3)**: Service locator
- **injectable (^2.5.0)**: Code generation for DI

### Networking
- **dio (^5.7.0)**: HTTP client
- **retrofit (^4.4.2)**: Type-safe API client generation
- **pretty_dio_logger (^1.4.0)**: Network logging

### Navigation
- **auto_route (^9.2.2)**: Declarative routing
- **auto_route_generator (^9.0.0)**: Route generation

### Data Modeling
- **freezed_annotation (^2.4.4)**: Annotations for immutable classes
- **json_annotation (^4.9.0)**: JSON serialization

### Storage
- **shared_preferences (^2.3.5)**: Simple key-value storage
- **flutter_secure_storage (^9.2.4)**: Secure storage for sensitive data

### UI Components
- **cached_network_image (^3.4.1)**: Image caching
- **flutter_svg (^2.0.16)**: SVG rendering
- **flutter_animate (^4.5.2)**: Animations
- **skeletonizer (^1.4.3)**: Loading skeletons

### Development Tools
- **flutter_gen_runner (^5.8.0)**: Asset generation
- **build_runner (^2.4.14)**: Code generation
- **chucker_flutter (^1.6.2)**: Network inspection

### Error Handling
- **fpdart (^1.1.1)**: Functional programming utilities
- **Custom Result Pattern**: Simplified error handling without use cases

## Data Flow

1. **User Interaction** → Feature/Presentation Layer (BLoC Event)
2. **BLoC** processes event → Calls Repository
3. **Repository** → Orchestrates data from multiple sources
4. **Data Source** → Handles local/remote data fetching
5. **Service** → Makes API calls using Retrofit/Dio
6. **Response** flows back through layers
7. **BLoC** emits new state → UI updates

## Simplified Clean Architecture Benefits

### Advantages of Skipping Use Cases:
- **Reduced Boilerplate**: Less code for simple CRUD operations
- **Faster Development**: Direct repository calls from BLoC
- **Easier Maintenance**: Fewer abstraction layers
- **Better for Small-Medium Apps**: Appropriate complexity level

### When to Consider Use Cases:
- Complex business rules
- Multiple repositories per operation
- Extensive data transformation
- Large enterprise applications

## Key Architectural Decisions

### 1. Result Pattern
Instead of throwing exceptions, the app uses a `Result<T>` type that can be either `Ok<T>` or `Error<T>`.

### 2. Feature-based Organization
Features are self-contained modules with their own presentation logic.

### 3. Dependency Injection
All dependencies are registered in a centralized configuration and injected where needed.

### 4. Immutable State
Using Freezed for immutable data classes and BLoC for predictable state management.

### 5. Repository Pattern
Repositories abstract data sources and provide a clean API for the presentation layer.

## File Naming Conventions

- **Screens**: `*_page.dart`
- **Widgets**: `*_widget.dart` or descriptive names
- **BLoCs**: `*_bloc.dart`, `*_event.dart`, `*_state.dart`
- **Models**: `*_models.dart`
- **Services**: `*_services.dart`
- **Repositories**: `*_repository.dart`, `*_repository_impl.dart`

## Testing Strategy

The architecture supports comprehensive testing:

- **Unit Tests**: Repository and service logic
- **Widget Tests**: Individual UI components
- **Integration Tests**: Feature flows
- **BLoC Tests**: State management logic


## Connecting App SDK Strategy

This diagram illustrates a modular SDK architecture with the following structure:

### Architecture Overview
Two Application Layers: Main App and Second App, each contained within separate Meloz environments
SDK Components: Three SDK modules that serve as the foundation for both applications
Bidirectional Communication: Arrows indicate data flow and communication between components
This architecture pattern is commonly used in enterprise applications where multiple apps need to share common functionality while maintaining separate deployment boundaries.

<img width="1904" height="1973" alt="Untitled-2025-09-04-1340" src="https://github.com/user-attachments/assets/a34ee871-bd7f-480d-8e9b-91377bc5fc63" />


## Performance Considerations

- **Image Caching**: Using cached_network_image for efficient image loading
- **State Management**: BLoC pattern for predictable performance
- **Lazy Loading**: Injectable lazy singletons for memory efficiency
- **Build Generation**: Compile-time code generation for better runtime performance

## Getting Started

1. **Dependencies**: Run `flutter pub get`
2. **Code Generation**: Run `flutter packages pub run build_runner build`
3. **Assets**: Run `flutter packages pub run flutter_gen`
4. **Development**: The app is ready to run with `flutter run`

This architecture provides a solid foundation for building scalable Flutter applications while maintaining simplicity and developer productivity.
