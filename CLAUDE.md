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

# Code generation (json_serializable, freezed, riverpod_generator, drift_dev, retrofit_generator, injectable_generator)
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
- `di/` — `@module`-annotated classes that register that feature's injectable bindings

**Features:** `auth`, `news`, `notification`, `profile`, `search_history`, `settings`

Cross-feature shared infrastructure (auth, profile, notification data/domain layers, shared entities, shared use cases) lives in `lib/core/data/` and `lib/core/domain/`. The `auth` feature therefore has no `data/` subdirectory — its datasources and repository implementation live in `lib/core/data/datasource/auth/` and `lib/core/data/repository/`.

Core infrastructure (theme, navigation, error types, network client, database, cache, constants, utilities, shared UI) lives in `lib/core/`.

Entry points: `lib/main.dart` initializes Firebase, dotenv, and `configureDependencies()`, then runs a `ProviderScope`-wrapped `App`. `lib/injector.dart` declares the `GetIt` instance and the `@InjectableInit()`-annotated `configureDependencies()` function; the generated `injector.config.dart` wires all bindings automatically.

## Key Patterns

### Dependency Injection
GetIt is the service locator (`injector` global in `lib/injector.dart`). Bindings are registered via the `injectable` package and code generation — annotate classes with `@injectable`, `@singleton`, `@lazySingleton`, or `@Named()`, and declare third-party registrations in `@module`-annotated abstract classes inside each area's `di/` folder. Run `build_runner` after any annotation change to regenerate `injector.config.dart`. Controllers pull dependencies directly from `injector()` inside their `build()` method.

### State Management
Riverpod with code generation (`@riverpod` / `@Riverpod(keepAlive: true)`). Every controller has a generated `.g.dart` file — always run `build_runner` after modifying annotated classes. State classes use Freezed for immutability (`.freezed.dart` files). The shared `LoadState` sealed class (`Empty`, `Loading`, `Loaded`, `Error`) is used across all feature controllers.

### Error Handling
The repository layer uses `fpdart` `Either<Failure, SuccessType>`. Exceptions are mapped to `Failure` subtypes via `ExceptionHandler.handleException()` (`lib/core/exception/exception_handler.dart`):
- `ApiFailure` — News API errors
- `FbAuthFailure` — Firebase Auth errors
- `FbFailure` — Firestore errors
- `CacheFailure` — Drift/local DB errors

Use cases implement typed interfaces from `lib/core/domain/usecase/usecase.dart` (`UseCaseFuture`, `UseCaseStream`, `UseCaseResult`, `UseCaseFutureVoid`, `UseCaseVoid`) and always return `Either`. `NoParams` is used when a use case takes no arguments.

### Networking
`DioClient` (singleton, `lib/core/network/dio/dio_client.dart`) wraps Dio with a base URL and two interceptors: `ApiKeyInterceptor` (injects the News API key from `.env`) and `LoggerInterceptor`. All News API calls go through this client.

### Local Database
Drift (SQLite abstraction) via `AppDatabase` (`lib/core/database/app_database.dart`). It holds two tables: `SavedNewsTable` (saved articles) and `SearchHistoryTable`. DAOs are `ArticleDao` and `SearchHistoryDao`. Models are in `lib/core/database/model/` and type converters in `lib/core/database/converter/`. The database is at schema version 2 with a migration from the previous Floor-based schema (v1).

### Cache / SharedPreferences
`BuzzWireAppCache` (`lib/core/cache/buzzwire_app_cache.dart`) is the typed SharedPreferences abstraction. It supports `String`, `int`, `double`, `bool`, and `List<String>` operations. The implementation is `BuzzWireAppCacheImpl`; preference key constants are in `lib/core/cache/constant/preference_keys.dart`.

### Navigation
GoRouter with a `@riverpod`-generated `router` provider (`lib/core/navigation/router/app_router.dart`). The router watches `authControllerProvider` and `appEntryControllerProvider` and redirects based on three conditions in order: onboarding seen, force-update check (Firebase Remote Config vs build number), and auth status. These controllers live in `lib/core/presentation/controllers/`.

Routes are defined as static `BuzzWireRoute` instances in `lib/core/navigation/route/route.dart`. Navigate using named routes:
```dart
context.goNamed(BuzzWireRoute.homeScreen.name)
context.pushNamed(BuzzWireRoute.newsDetailScreen.name, extra: article)
```
The `extra` parameter passes typed objects (e.g. `ArticleEntity`, `TopicEntity`, `String`) — cast from `state.extra` inside the builder.

The main shell uses `StatefulShellRoute.indexedStack` with four branches (Home, Discover, Saved, Settings) rendered by `HomeWrapperScreen` using `persistent_bottom_nav_bar_v2`. Each branch has its own `GlobalKey<NavigatorState>`.

Custom page transitions use `TransitionFactory.getSlidePageBuilder()`. Dialog routes use `DialogPage` (`lib/core/navigation/dialog_page.dart`). `NavigationExtension` on `BuildContext` (`lib/core/navigation/navigation_extension.dart`) provides `popUntilPath()`.

### Pagination
Infinite scroll is handled by `PaginationListView` and `PaginationSliverListView` in `lib/core/ui/widgets/pagination/`. Use `ScrollNotificationHandler` to detect when more data should be loaded, and `LoadingMoreDataWidget` as the bottom loader indicator.

### Models and Code Generation
Remote models use `@JsonSerializable()` with generated `.g.dart` files. Local Drift tables are `Table` subclasses (not `@Entity`). State classes use `@freezed`. After any annotation change, regenerate with `build_runner`.

### Environment Variables
Secrets are stored in `.env` (included as a Flutter asset). Access via `dotenv.env[BuzzWireAppConstants.<key>]`. Key constant names are defined in `BuzzWireAppConstants` (`lib/core/constants/app_constants.dart`): `NEWS_API_KEY`, `NEWS_API_BASE_URL`, `APP_WRITE_PROJECT_ID`, `APP_WRITE_BASE_URL`, `APP_WRITE_PROFILE_IMAGE_BUCKET_ID`, `APP_WRITE_TOPICS_IMAGE_BUCKET_ID`.

### External Services
- **Firebase Auth** — email/password sign-in, email verification, password reset
- **Cloud Firestore** — user profiles, device tokens, topics
- **Firebase Messaging + flutter_local_notifications** — push notifications with foreground/background/terminated handlers; `BuzzWireMessagingService` manages the full lifecycle
- **Firebase Remote Config** — minimum app version for force-update checks; helper in `lib/core/config/firebase_remote_config_helper.dart`
- **Appwrite Storage** — profile images and topic images
- **News API** — headlines and article search via Dio

### Utilities
`lib/core/common/` contains:

- **Extensions** (`lib/core/common/extension/`): `string_extension.dart` (`.orEmpty`), `list_extension.dart`, `num_extension.dart`, `bool_extension.dart`
- **UI Extensions** (`lib/core/ui/extensions/`): `context_extension.dart` (theme/media query shortcuts)
- **Utils** (`lib/core/common/utils/`): `Debouncer`, `BuzzWireDeviceUtils`, `NetworkConnectionChecker`, `PackageInfoHelper`, date and string utilities
- **Logging** (`lib/core/common/logging/`): `BuzzWireLoggerHelper` — structured logging (wraps `logger` package); `MyObserver` — Riverpod provider observer
- **Formatters** (`lib/core/common/formatters/`): shared formatting helpers
- **Validators** (`lib/core/domain/validators/`): `EmailValidator`, `PasswordValidator`

`ReusableStreamController<T>` (`lib/core/common/utils/reusable_stream_controller.dart`) is a lazy broadcast stream controller used in datasources for Firestore real-time subscriptions; it recreates the controller if closed.
