// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchNewsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  List<SearchHistoryEntity> get searchHistories =>
      throw _privateConstructorUsedError;
  List<ArticleEntity> get savedArticles => throw _privateConstructorUsedError;
  List<ArticleEntity> get searchResults => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchNewsStateCopyWith<SearchNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchNewsStateCopyWith<$Res> {
  factory $SearchNewsStateCopyWith(
          SearchNewsState value, $Res Function(SearchNewsState) then) =
      _$SearchNewsStateCopyWithImpl<$Res, SearchNewsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      List<SearchHistoryEntity> searchHistories,
      List<ArticleEntity> savedArticles,
      List<ArticleEntity> searchResults,
      int currentPage,
      int lastPage});
}

/// @nodoc
class _$SearchNewsStateCopyWithImpl<$Res, $Val extends SearchNewsState>
    implements $SearchNewsStateCopyWith<$Res> {
  _$SearchNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? searchHistories = null,
    Object? savedArticles = null,
    Object? searchResults = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      searchHistories: null == searchHistories
          ? _value.searchHistories
          : searchHistories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistoryEntity>,
      savedArticles: null == savedArticles
          ? _value.savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchNewsStateImplCopyWith<$Res>
    implements $SearchNewsStateCopyWith<$Res> {
  factory _$$SearchNewsStateImplCopyWith(_$SearchNewsStateImpl value,
          $Res Function(_$SearchNewsStateImpl) then) =
      __$$SearchNewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      List<SearchHistoryEntity> searchHistories,
      List<ArticleEntity> savedArticles,
      List<ArticleEntity> searchResults,
      int currentPage,
      int lastPage});
}

/// @nodoc
class __$$SearchNewsStateImplCopyWithImpl<$Res>
    extends _$SearchNewsStateCopyWithImpl<$Res, _$SearchNewsStateImpl>
    implements _$$SearchNewsStateImplCopyWith<$Res> {
  __$$SearchNewsStateImplCopyWithImpl(
      _$SearchNewsStateImpl _value, $Res Function(_$SearchNewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? searchHistories = null,
    Object? savedArticles = null,
    Object? searchResults = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(_$SearchNewsStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      searchHistories: null == searchHistories
          ? _value._searchHistories
          : searchHistories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistoryEntity>,
      savedArticles: null == savedArticles
          ? _value._savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchNewsStateImpl implements _SearchNewsState {
  const _$SearchNewsStateImpl(
      {this.loadState = const Empty(),
      final List<SearchHistoryEntity> searchHistories = const [],
      final List<ArticleEntity> savedArticles = const [],
      final List<ArticleEntity> searchResults = const [],
      this.currentPage = 1,
      this.lastPage = 1})
      : _searchHistories = searchHistories,
        _savedArticles = savedArticles,
        _searchResults = searchResults;

  @override
  @JsonKey()
  final LoadState loadState;
  final List<SearchHistoryEntity> _searchHistories;
  @override
  @JsonKey()
  List<SearchHistoryEntity> get searchHistories {
    if (_searchHistories is EqualUnmodifiableListView) return _searchHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHistories);
  }

  final List<ArticleEntity> _savedArticles;
  @override
  @JsonKey()
  List<ArticleEntity> get savedArticles {
    if (_savedArticles is EqualUnmodifiableListView) return _savedArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedArticles);
  }

  final List<ArticleEntity> _searchResults;
  @override
  @JsonKey()
  List<ArticleEntity> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;

  @override
  String toString() {
    return 'SearchNewsState(loadState: $loadState, searchHistories: $searchHistories, savedArticles: $savedArticles, searchResults: $searchResults, currentPage: $currentPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchNewsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            const DeepCollectionEquality()
                .equals(other._searchHistories, _searchHistories) &&
            const DeepCollectionEquality()
                .equals(other._savedArticles, _savedArticles) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadState,
      const DeepCollectionEquality().hash(_searchHistories),
      const DeepCollectionEquality().hash(_savedArticles),
      const DeepCollectionEquality().hash(_searchResults),
      currentPage,
      lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchNewsStateImplCopyWith<_$SearchNewsStateImpl> get copyWith =>
      __$$SearchNewsStateImplCopyWithImpl<_$SearchNewsStateImpl>(
          this, _$identity);
}

abstract class _SearchNewsState implements SearchNewsState {
  const factory _SearchNewsState(
      {final LoadState loadState,
      final List<SearchHistoryEntity> searchHistories,
      final List<ArticleEntity> savedArticles,
      final List<ArticleEntity> searchResults,
      final int currentPage,
      final int lastPage}) = _$SearchNewsStateImpl;

  @override
  LoadState get loadState;
  @override
  List<SearchHistoryEntity> get searchHistories;
  @override
  List<ArticleEntity> get savedArticles;
  @override
  List<ArticleEntity> get searchResults;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$SearchNewsStateImplCopyWith<_$SearchNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
