# Core App

A Flutter application implementing **Clean Architecture** principles with a simplified three-layer approach: Core, Data-Domain, and Feature (Presentation). This Pokemon-themed app demonstrates modern Flutter development practices and architectural patterns.

## 🏗️ Architecture

This project follows Clean Architecture with the following layers:

- **Core Layer** (`/lib/src/shared/`): Shared components, utilities, and configurations
- **Data-Domain Layer** (`/lib/src/data/`): Data operations, business logic, and API interactions
- **Feature Layer** (`/lib/src/features/`): UI and presentation logic organized by features

For detailed architecture documentation, see [ARCHITECTURE.md](ARCHITECTURE.md).

## 🚀 Key Features

- **Clean Architecture**: Simplified three-layer approach without use cases
- **State Management**: BLoC pattern with flutter_bloc
- **Dependency Injection**: get_it with injectable for service location
- **Navigation**: Auto Route for type-safe routing
- **Networking**: Retrofit with Dio for API communication
- **Data Modeling**: Freezed for immutable data classes
- **Asset Management**: flutter_gen for type-safe assets
- **Error Handling**: Custom Result pattern for robust error management

## 📱 Screens

- **Home**: Pokemon category navigation
- **Pokedex**: Grid view of Pokemon with search functionality
- **Pokemon Detail**: Detailed Pokemon information with animations

## 🛠️ Tech Stack

### Core Dependencies
- **flutter_bloc**: State management
- **get_it & injectable**: Dependency injection
- **auto_route**: Navigation and routing
- **dio & retrofit**: HTTP networking
- **freezed**: Immutable data classes
- **cached_network_image**: Image caching
- **flutter_secure_storage**: Secure storage

### Development Tools
- **build_runner**: Code generation
- **flutter_gen**: Asset generation
- **freezed**: Data class generation
- **injectable**: DI code generation

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.6.0)
- Dart SDK
- VS Code or Android Studio

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd core_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   make generate
   # Or manually:
   # dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── app.dart                    # Main app configuration
├── main.dart                   # Entry point
├── l10n/                      # Localization files
└── src/
    ├── data/                  # Data layer
    │   ├── datasources/       # Data source implementations
    │   ├── models/           # Data models and DTOs
    │   ├── repositories/     # Repository implementations
    │   └── services/         # API services
    ├── features/             # Feature modules
    │   ├── home_page.dart    # Home screen
    │   ├── pokelist/         # Pokemon list feature
    │   └── root.dart         # Navigation root
    └── shared/               # Core/shared components
        ├── assets/           # Generated assets
        ├── components/       # Reusable UI components
        ├── config/          # App configuration
        ├── extensions/      # Dart extensions
        └── utils/           # Utility classes
```

## 🔨 Development Commands

```bash
# Install dependencies
flutter pub get

# Generate code (routes, assets, models)
make generate

# Build runner for code generation
dart run build_runner build --delete-conflicting-outputs

# Generate assets
dart run flutter_gen

# Run tests
flutter test

# Build APK
flutter build apk

# Build iOS
flutter build ios
```

## 📖 Learning Resources

- [Clean Architecture Documentation](ARCHITECTURE.md)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [Auto Route Documentation](https://auto-route.vercel.app/)
- [Injectable Documentation](https://pub.dev/packages/injectable)
- [Freezed Documentation](https://pub.dev/packages/freezed)

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. **Fork the repository** and create a feature branch
2. **Follow the existing architecture patterns** described in [ARCHITECTURE.md](ARCHITECTURE.md)
3. **Write tests** for new features and bug fixes
4. **Run code generation** before committing: `make generate`
5. **Follow naming conventions** as outlined in the architecture documentation
6. **Submit a pull request** with a clear description of changes

### Code Style
- Use `dart format` for consistent formatting
- Follow the project's established patterns for BLoC, repositories, and services
- Add documentation for public APIs
- Use meaningful commit messages

## 📹 Demo

https://github.com/user-attachments/assets/686fd2ec-a0c1-4544-b49c-3dc522b6fc7d



## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

- **Issues**: Report bugs and request features via GitHub Issues
- **Discussions**: Join community discussions in GitHub Discussions
- **Documentation**: Comprehensive architecture documentation available in [ARCHITECTURE.md](ARCHITECTURE.md)

## 🙏 Acknowledgments

- [PokeAPI](https://pokeapi.co/) for providing the Pokemon data
- Flutter team for the amazing framework
- BLoC library contributors for excellent state management
- Clean Architecture principles by Robert C. Martin

