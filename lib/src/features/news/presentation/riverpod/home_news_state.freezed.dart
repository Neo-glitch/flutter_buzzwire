// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeNewsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  List<ArticleEntity> get articles => throw _privateConstructorUsedError;
  List<ArticleEntity> get savedArticles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeNewsStateCopyWith<HomeNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeNewsStateCopyWith<$Res> {
  factory $HomeNewsStateCopyWith(
          HomeNewsState value, $Res Function(HomeNewsState) then) =
      _$HomeNewsStateCopyWithImpl<$Res, HomeNewsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      int currentPage,
      int lastPage,
      List<ArticleEntity> articles,
      List<ArticleEntity> savedArticles});
}

/// @nodoc
class _$HomeNewsStateCopyWithImpl<$Res, $Val extends HomeNewsState>
    implements $HomeNewsStateCopyWith<$Res> {
  _$HomeNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? articles = null,
    Object? savedArticles = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      savedArticles: null == savedArticles
          ? _value.savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeNewsStateImplCopyWith<$Res>
    implements $HomeNewsStateCopyWith<$Res> {
  factory _$$HomeNewsStateImplCopyWith(
          _$HomeNewsStateImpl value, $Res Function(_$HomeNewsStateImpl) then) =
      __$$HomeNewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      int currentPage,
      int lastPage,
      List<ArticleEntity> articles,
      List<ArticleEntity> savedArticles});
}

/// @nodoc
class __$$HomeNewsStateImplCopyWithImpl<$Res>
    extends _$HomeNewsStateCopyWithImpl<$Res, _$HomeNewsStateImpl>
    implements _$$HomeNewsStateImplCopyWith<$Res> {
  __$$HomeNewsStateImplCopyWithImpl(
      _$HomeNewsStateImpl _value, $Res Function(_$HomeNewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? articles = null,
    Object? savedArticles = null,
  }) {
    return _then(_$HomeNewsStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      savedArticles: null == savedArticles
          ? _value._savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ));
  }
}

/// @nodoc

class _$HomeNewsStateImpl implements _HomeNewsState {
  const _$HomeNewsStateImpl(
      {this.loadState = const Empty(),
      this.currentPage = 1,
      this.lastPage = 1,
      final List<ArticleEntity> articles = const [],
      final List<ArticleEntity> savedArticles = const []})
      : _articles = articles,
        _savedArticles = savedArticles;

  @override
  @JsonKey()
  final LoadState loadState;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;
  final List<ArticleEntity> _articles;
  @override
  @JsonKey()
  List<ArticleEntity> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  final List<ArticleEntity> _savedArticles;
  @override
  @JsonKey()
  List<ArticleEntity> get savedArticles {
    if (_savedArticles is EqualUnmodifiableListView) return _savedArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedArticles);
  }

  @override
  String toString() {
    return 'HomeNewsState(loadState: $loadState, currentPage: $currentPage, lastPage: $lastPage, articles: $articles, savedArticles: $savedArticles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeNewsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality()
                .equals(other._savedArticles, _savedArticles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadState,
      currentPage,
      lastPage,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(_savedArticles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeNewsStateImplCopyWith<_$HomeNewsStateImpl> get copyWith =>
      __$$HomeNewsStateImplCopyWithImpl<_$HomeNewsStateImpl>(this, _$identity);
}

abstract class _HomeNewsState implements HomeNewsState {
  const factory _HomeNewsState(
      {final LoadState loadState,
      final int currentPage,
      final int lastPage,
      final List<ArticleEntity> articles,
      final List<ArticleEntity> savedArticles}) = _$HomeNewsStateImpl;

  @override
  LoadState get loadState;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  List<ArticleEntity> get articles;
  @override
  List<ArticleEntity> get savedArticles;
  @override
  @JsonKey(ignore: true)
  _$$HomeNewsStateImplCopyWith<_$HomeNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
