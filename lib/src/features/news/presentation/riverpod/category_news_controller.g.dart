// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_news_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryNewsControllerHash() =>
    r'fede7d6e53d501481ef8e355c893a4aef4027621';

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

abstract class _$CategoryNewsController
    extends BuildlessAutoDisposeNotifier<CategoryNewsState> {
  late final String category;

  CategoryNewsState build(
    String category,
  );
}

/// See also [CategoryNewsController].
@ProviderFor(CategoryNewsController)
const categoryNewsControllerProvider = CategoryNewsControllerFamily();

/// See also [CategoryNewsController].
class CategoryNewsControllerFamily extends Family<CategoryNewsState> {
  /// See also [CategoryNewsController].
  const CategoryNewsControllerFamily();

  /// See also [CategoryNewsController].
  CategoryNewsControllerProvider call(
    String category,
  ) {
    return CategoryNewsControllerProvider(
      category,
    );
  }

  @override
  CategoryNewsControllerProvider getProviderOverride(
    covariant CategoryNewsControllerProvider provider,
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
  String? get name => r'categoryNewsControllerProvider';
}

/// See also [CategoryNewsController].
class CategoryNewsControllerProvider extends AutoDisposeNotifierProviderImpl<
    CategoryNewsController, CategoryNewsState> {
  /// See also [CategoryNewsController].
  CategoryNewsControllerProvider(
    String category,
  ) : this._internal(
          () => CategoryNewsController()..category = category,
          from: categoryNewsControllerProvider,
          name: r'categoryNewsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryNewsControllerHash,
          dependencies: CategoryNewsControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryNewsControllerFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryNewsControllerProvider._internal(
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
  CategoryNewsState runNotifierBuild(
    covariant CategoryNewsController notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(CategoryNewsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryNewsControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<CategoryNewsController, CategoryNewsState>
      createElement() {
    return _CategoryNewsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryNewsControllerProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryNewsControllerRef
    on AutoDisposeNotifierProviderRef<CategoryNewsState> {
  /// The parameter `category` of this provider.
  String get category;
}

class _CategoryNewsControllerProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryNewsController,
        CategoryNewsState> with CategoryNewsControllerRef {
  _CategoryNewsControllerProviderElement(super.provider);

  @override
  String get category => (origin as CategoryNewsControllerProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
