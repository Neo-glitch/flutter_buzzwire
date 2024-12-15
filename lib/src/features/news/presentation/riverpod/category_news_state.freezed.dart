// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryNewsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  List<ArticleEntity> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryNewsStateCopyWith<CategoryNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryNewsStateCopyWith<$Res> {
  factory $CategoryNewsStateCopyWith(
          CategoryNewsState value, $Res Function(CategoryNewsState) then) =
      _$CategoryNewsStateCopyWithImpl<$Res, CategoryNewsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      int currentPage,
      int lastPage,
      List<ArticleEntity> articles});
}

/// @nodoc
class _$CategoryNewsStateCopyWithImpl<$Res, $Val extends CategoryNewsState>
    implements $CategoryNewsStateCopyWith<$Res> {
  _$CategoryNewsStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryNewsStateImplCopyWith<$Res>
    implements $CategoryNewsStateCopyWith<$Res> {
  factory _$$CategoryNewsStateImplCopyWith(_$CategoryNewsStateImpl value,
          $Res Function(_$CategoryNewsStateImpl) then) =
      __$$CategoryNewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      int currentPage,
      int lastPage,
      List<ArticleEntity> articles});
}

/// @nodoc
class __$$CategoryNewsStateImplCopyWithImpl<$Res>
    extends _$CategoryNewsStateCopyWithImpl<$Res, _$CategoryNewsStateImpl>
    implements _$$CategoryNewsStateImplCopyWith<$Res> {
  __$$CategoryNewsStateImplCopyWithImpl(_$CategoryNewsStateImpl _value,
      $Res Function(_$CategoryNewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? articles = null,
  }) {
    return _then(_$CategoryNewsStateImpl(
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
    ));
  }
}

/// @nodoc

class _$CategoryNewsStateImpl implements _CategoryNewsState {
  const _$CategoryNewsStateImpl(
      {this.loadState = const Empty(),
      this.currentPage = 1,
      this.lastPage = 1,
      final List<ArticleEntity> articles = const []})
      : _articles = articles;

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

  @override
  String toString() {
    return 'CategoryNewsState(loadState: $loadState, currentPage: $currentPage, lastPage: $lastPage, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryNewsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState, currentPage, lastPage,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryNewsStateImplCopyWith<_$CategoryNewsStateImpl> get copyWith =>
      __$$CategoryNewsStateImplCopyWithImpl<_$CategoryNewsStateImpl>(
          this, _$identity);
}

abstract class _CategoryNewsState implements CategoryNewsState {
  const factory _CategoryNewsState(
      {final LoadState loadState,
      final int currentPage,
      final int lastPage,
      final List<ArticleEntity> articles}) = _$CategoryNewsStateImpl;

  @override
  LoadState get loadState;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  List<ArticleEntity> get articles;
  @override
  @JsonKey(ignore: true)
  _$$CategoryNewsStateImplCopyWith<_$CategoryNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
