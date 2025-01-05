// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_news_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeNewsControllerHash() =>
    r'052f428b79d1f7f7c695e24e831287a5b4dbf42d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$HomeNewsController
    extends BuildlessAutoDisposeNotifier<HomeNewsState> {
  late final String category;

  HomeNewsState build(
    String category,
  );
}

/// See also [HomeNewsController].
@ProviderFor(HomeNewsController)
const homeNewsControllerProvider = HomeNewsControllerFamily();

/// See also [HomeNewsController].
class HomeNewsControllerFamily extends Family<HomeNewsState> {
  /// See also [HomeNewsController].
  const HomeNewsControllerFamily();

  /// See also [HomeNewsController].
  HomeNewsControllerProvider call(
    String category,
  ) {
    return HomeNewsControllerProvider(
      category,
    );
  }

  @override
  HomeNewsControllerProvider getProviderOverride(
    covariant HomeNewsControllerProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homeNewsControllerProvider';
}

/// See also [HomeNewsController].
class HomeNewsControllerProvider
    extends AutoDisposeNotifierProviderImpl<HomeNewsController, HomeNewsState> {
  /// See also [HomeNewsController].
  HomeNewsControllerProvider(
    String category,
  ) : this._internal(
          () => HomeNewsController()..category = category,
          from: homeNewsControllerProvider,
          name: r'homeNewsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeNewsControllerHash,
          dependencies: HomeNewsControllerFamily._dependencies,
          allTransitiveDependencies:
              HomeNewsControllerFamily._allTransitiveDependencies,
          category: category,
        );

  HomeNewsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  HomeNewsState runNotifierBuild(
    covariant HomeNewsController notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(HomeNewsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeNewsControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HomeNewsController, HomeNewsState>
      createElement() {
    return _HomeNewsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeNewsControllerProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeNewsControllerRef on AutoDisposeNotifierProviderRef<HomeNewsState> {
  /// The parameter `category` of this provider.
  String get category;
}

class _HomeNewsControllerProviderElement
    extends AutoDisposeNotifierProviderElement<HomeNewsController,
        HomeNewsState> with HomeNewsControllerRef {
  _HomeNewsControllerProviderElement(super.provider);

  @override
  String get category => (origin as HomeNewsControllerProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
