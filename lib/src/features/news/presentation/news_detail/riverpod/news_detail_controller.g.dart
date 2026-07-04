// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsDetailControllerHash() =>
    r'261f6e298479c74309609f7f1cc7807d82215a71';

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

abstract class _$NewsDetailController
    extends BuildlessAutoDisposeNotifier<NewsDetailState> {
  late final ArticleEntity article;

  NewsDetailState build(
    ArticleEntity article,
  );
}

/// See also [NewsDetailController].
@ProviderFor(NewsDetailController)
const newsDetailControllerProvider = NewsDetailControllerFamily();

/// See also [NewsDetailController].
class NewsDetailControllerFamily extends Family<NewsDetailState> {
  /// See also [NewsDetailController].
  const NewsDetailControllerFamily();

  /// See also [NewsDetailController].
  NewsDetailControllerProvider call(
    ArticleEntity article,
  ) {
    return NewsDetailControllerProvider(
      article,
    );
  }

  @override
  NewsDetailControllerProvider getProviderOverride(
    covariant NewsDetailControllerProvider provider,
  ) {
    return call(
      provider.article,
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
  String? get name => r'newsDetailControllerProvider';
}

/// See also [NewsDetailController].
class NewsDetailControllerProvider extends AutoDisposeNotifierProviderImpl<
    NewsDetailController, NewsDetailState> {
  /// See also [NewsDetailController].
  NewsDetailControllerProvider(
    ArticleEntity article,
  ) : this._internal(
          () => NewsDetailController()..article = article,
          from: newsDetailControllerProvider,
          name: r'newsDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsDetailControllerHash,
          dependencies: NewsDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              NewsDetailControllerFamily._allTransitiveDependencies,
          article: article,
        );

  NewsDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.article,
  }) : super.internal();

  final ArticleEntity article;

  @override
  NewsDetailState runNotifierBuild(
    covariant NewsDetailController notifier,
  ) {
    return notifier.build(
      article,
    );
  }

  @override
  Override overrideWith(NewsDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsDetailControllerProvider._internal(
        () => create()..article = article,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        article: article,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NewsDetailController, NewsDetailState>
      createElement() {
    return _NewsDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailControllerProvider && other.article == article;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, article.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsDetailControllerRef
    on AutoDisposeNotifierProviderRef<NewsDetailState> {
  /// The parameter `article` of this provider.
  ArticleEntity get article;
}

class _NewsDetailControllerProviderElement
    extends AutoDisposeNotifierProviderElement<NewsDetailController,
        NewsDetailState> with NewsDetailControllerRef {
  _NewsDetailControllerProviderElement(super.provider);

  @override
  ArticleEntity get article => (origin as NewsDetailControllerProvider).article;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
