# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About

Buzzwire is a Flutter news app delivering real-time updates, personalized feeds, and breaking news alerts. It targets iOS and Android.

## Commands

```bash
# Run the app
flutter run

# Get packages
flutter pub get

# Static analysis / lint
flutter analyze

# Run all tests
flutter test

# Run a single test file
flutter test test/path/to/test_file.dart

# Code generation (json_serializable, freezed, riverpod_generator, floor_generator)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for code generation during development
flutter pub run build_runner watch --delete-conflicting-outputs

# Build Android
flutter build apk
flutter build appbundle

# Build iOS
flutter build ios
```

## Architecture

Clean Architecture with feature-based modules. Each feature lives under `lib/src/features/<feature>/` and is internally split into:

- `data/` — models (JSON-annotated), mappers, datasource implementations, repository implementations
- `domain/` — entities (plain Dart), repository interfaces, use case classes
- `presentation/` — screens, widgets, Riverpod controllers and states
- `di/` — a single `provideXxxDependencies()` function that registers that feature's GetIt bindings

Shared cross-feature code lives in `lib/src/shared/`.

Core infrastructure (theme, navigation, error types, network client, constants, utils) lives in `lib/core/`.

Entry points: `lib/main.dart` initializes Firebase, dotenv, and `di.init()`, then runs a `ProviderScope`-wrapped `App`. `lib/injector.dart` bootstraps all GetIt registrations by calling each feature's `provideXxxDependencies()`.

## Key Patterns

### Dependency Injection
GetIt is the service locator (`injector` global in `lib/injector.dart`). Infrastructure singletons (Firebase, Dio, SharedPrefs, Floor DB, Appwrite) are registered in `injector.dart`; feature-specific bindings are registered via each feature's `di/` file. Controllers pull dependencies directly from `injector()` inside their `build()` method.

### State Management
Riverpod with code generation (`@riverpod` / `@Riverpod(keepAlive: true)`). Every controller has a generated `.g.dart` file — always run `build_runner` after modifying annotated classes. State classes use Freezed for immutability (`.freezed.dart` files). The shared `LoadState` sealed class (`Empty`, `Loading`, `Loaded`, `Error`) is used across all feature controllers.

### Error Handling
The repository layer uses `fpdart` `Either<Failure, SuccessType>`. Exceptions are mapped to `Failure` subtypes via `ExceptionHandler.handleException()`:
- `ApiFailure` — News API errors
- `FbAuthFailure` — Firebase Auth errors
- `FbFailure` — Firestore errors
- `CacheFailure` — Floor/local DB errors

Use cases implement typed interfaces from `lib/core/usecase/usecase.dart` (`UseCaseFuture`, `UseCaseStream`, `UseCaseResult`, etc.) and always return `Either`. `NoParams` is used when a use case takes no arguments.

### Networking
`DioClient` (singleton, `lib/core/network/dio/dio_client.dart`) wraps Dio with a base URL and two interceptors: `ApiKeyInterceptor` (injects the News API key from `.env`) and `LoggerInterceptor`. All News API calls go through this client.

### Local Database
Floor (SQLite abstraction) via `AppDatabase` (`lib/src/shared/data/datasources/local/app_database.dart`). It holds two entities: `LocalArticleModel` (saved articles) and `SearchHistoryModel`. DAOs are `ArticleDao` and `SearchHistoryDao`.

### Navigation
GoRouter with a `@riverpod`-generated `router` provider. The router watches `authControllerProvider` and `appEntryControllerProvider` to redirect unauthenticated or first-time users. Routes are named constants defined in `lib/core/navigation/route.dart`. The main shell uses `StatefulShellRoute.indexedStack` with four branches (Home, Discover, Saved, Settings) rendered by `HomeWrapperScreen` using `persistent_bottom_nav_bar_v2`.

### Models and Code Generation
Remote models use `@JsonSerializable()` with generated `.g.dart` files. Local Floor entities are annotated with `@Entity`. State classes use `@freezed`. After any annotation change, regenerate with `build_runner`.

### Environment Variables
Secrets are stored in `.env` (included as a Flutter asset). Access via `dotenv.env[BuzzWireAppConstants.<key>]`. Key constant names are defined in `BuzzWireAppConstants` (`lib/core/constants/app_constants.dart`): `NEWS_API_KEY`, `NEWS_API_BASE_URL`, `APP_WRITE_PROJECT_ID`, `APP_WRITE_BASE_URL`, `APP_WRITE_PROFILE_IMAGE_BUCKET_ID`, `APP_WRITE_TOPICS_IMAGE_BUCKET_ID`.

### External Services
- **Firebase Auth** — email/password sign-in, email verification, password reset
- **Cloud Firestore** — user profiles, device tokens, topics
- **Firebase Messaging + flutter_local_notifications** — push notifications with foreground/background/terminated handlers; `BuzzWireMessagingService` manages the full lifecycle
- **Firebase Remote Config** — minimum app version for force-update checks
- **Appwrite Storage** — profile images and topic images
- **News API** — headlines and article search via Dio
