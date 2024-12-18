// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverNewsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  List<ArticleEntity> get breakingNewsItems =>
      throw _privateConstructorUsedError;
  List<ArticleEntity> get firstTrendingNewsList =>
      throw _privateConstructorUsedError;
  List<ArticleEntity> get secondTrendingNewsList =>
      throw _privateConstructorUsedError;
  List<ArticleEntity> get thirdTrendingNewsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverNewsStateCopyWith<DiscoverNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverNewsStateCopyWith<$Res> {
  factory $DiscoverNewsStateCopyWith(
          DiscoverNewsState value, $Res Function(DiscoverNewsState) then) =
      _$DiscoverNewsStateCopyWithImpl<$Res, DiscoverNewsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      List<ArticleEntity> breakingNewsItems,
      List<ArticleEntity> firstTrendingNewsList,
      List<ArticleEntity> secondTrendingNewsList,
      List<ArticleEntity> thirdTrendingNewsList});
}

/// @nodoc
class _$DiscoverNewsStateCopyWithImpl<$Res, $Val extends DiscoverNewsState>
    implements $DiscoverNewsStateCopyWith<$Res> {
  _$DiscoverNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? breakingNewsItems = null,
    Object? firstTrendingNewsList = null,
    Object? secondTrendingNewsList = null,
    Object? thirdTrendingNewsList = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      breakingNewsItems: null == breakingNewsItems
          ? _value.breakingNewsItems
          : breakingNewsItems // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      firstTrendingNewsList: null == firstTrendingNewsList
          ? _value.firstTrendingNewsList
          : firstTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      secondTrendingNewsList: null == secondTrendingNewsList
          ? _value.secondTrendingNewsList
          : secondTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      thirdTrendingNewsList: null == thirdTrendingNewsList
          ? _value.thirdTrendingNewsList
          : thirdTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoverNewsStateImplCopyWith<$Res>
    implements $DiscoverNewsStateCopyWith<$Res> {
  factory _$$DiscoverNewsStateImplCopyWith(_$DiscoverNewsStateImpl value,
          $Res Function(_$DiscoverNewsStateImpl) then) =
      __$$DiscoverNewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      List<ArticleEntity> breakingNewsItems,
      List<ArticleEntity> firstTrendingNewsList,
      List<ArticleEntity> secondTrendingNewsList,
      List<ArticleEntity> thirdTrendingNewsList});
}

/// @nodoc
class __$$DiscoverNewsStateImplCopyWithImpl<$Res>
    extends _$DiscoverNewsStateCopyWithImpl<$Res, _$DiscoverNewsStateImpl>
    implements _$$DiscoverNewsStateImplCopyWith<$Res> {
  __$$DiscoverNewsStateImplCopyWithImpl(_$DiscoverNewsStateImpl _value,
      $Res Function(_$DiscoverNewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? breakingNewsItems = null,
    Object? firstTrendingNewsList = null,
    Object? secondTrendingNewsList = null,
    Object? thirdTrendingNewsList = null,
  }) {
    return _then(_$DiscoverNewsStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      breakingNewsItems: null == breakingNewsItems
          ? _value._breakingNewsItems
          : breakingNewsItems // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      firstTrendingNewsList: null == firstTrendingNewsList
          ? _value._firstTrendingNewsList
          : firstTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      secondTrendingNewsList: null == secondTrendingNewsList
          ? _value._secondTrendingNewsList
          : secondTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
      thirdTrendingNewsList: null == thirdTrendingNewsList
          ? _value._thirdTrendingNewsList
          : thirdTrendingNewsList // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ));
  }
}

/// @nodoc

class _$DiscoverNewsStateImpl implements _DiscoverNewsState {
  const _$DiscoverNewsStateImpl(
      {this.loadState = const Empty(),
      final List<ArticleEntity> breakingNewsItems = const [],
      final List<ArticleEntity> firstTrendingNewsList = const [],
      final List<ArticleEntity> secondTrendingNewsList = const [],
      final List<ArticleEntity> thirdTrendingNewsList = const []})
      : _breakingNewsItems = breakingNewsItems,
        _firstTrendingNewsList = firstTrendingNewsList,
        _secondTrendingNewsList = secondTrendingNewsList,
        _thirdTrendingNewsList = thirdTrendingNewsList;

  @override
  @JsonKey()
  final LoadState loadState;
  final List<ArticleEntity> _breakingNewsItems;
  @override
  @JsonKey()
  List<ArticleEntity> get breakingNewsItems {
    if (_breakingNewsItems is EqualUnmodifiableListView)
      return _breakingNewsItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakingNewsItems);
  }

  final List<ArticleEntity> _firstTrendingNewsList;
  @override
  @JsonKey()
  List<ArticleEntity> get firstTrendingNewsList {
    if (_firstTrendingNewsList is EqualUnmodifiableListView)
      return _firstTrendingNewsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstTrendingNewsList);
  }

  final List<ArticleEntity> _secondTrendingNewsList;
  @override
  @JsonKey()
  List<ArticleEntity> get secondTrendingNewsList {
    if (_secondTrendingNewsList is EqualUnmodifiableListView)
      return _secondTrendingNewsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondTrendingNewsList);
  }

  final List<ArticleEntity> _thirdTrendingNewsList;
  @override
  @JsonKey()
  List<ArticleEntity> get thirdTrendingNewsList {
    if (_thirdTrendingNewsList is EqualUnmodifiableListView)
      return _thirdTrendingNewsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thirdTrendingNewsList);
  }

  @override
  String toString() {
    return 'DiscoverNewsState(loadState: $loadState, breakingNewsItems: $breakingNewsItems, firstTrendingNewsList: $firstTrendingNewsList, secondTrendingNewsList: $secondTrendingNewsList, thirdTrendingNewsList: $thirdTrendingNewsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverNewsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            const DeepCollectionEquality()
                .equals(other._breakingNewsItems, _breakingNewsItems) &&
            const DeepCollectionEquality()
                .equals(other._firstTrendingNewsList, _firstTrendingNewsList) &&
            const DeepCollectionEquality().equals(
                other._secondTrendingNewsList, _secondTrendingNewsList) &&
            const DeepCollectionEquality()
                .equals(other._thirdTrendingNewsList, _thirdTrendingNewsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadState,
      const DeepCollectionEquality().hash(_breakingNewsItems),
      const DeepCollectionEquality().hash(_firstTrendingNewsList),
      const DeepCollectionEquality().hash(_secondTrendingNewsList),
      const DeepCollectionEquality().hash(_thirdTrendingNewsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverNewsStateImplCopyWith<_$DiscoverNewsStateImpl> get copyWith =>
      __$$DiscoverNewsStateImplCopyWithImpl<_$DiscoverNewsStateImpl>(
          this, _$identity);
}

abstract class _DiscoverNewsState implements DiscoverNewsState {
  const factory _DiscoverNewsState(
          {final LoadState loadState,
          final List<ArticleEntity> breakingNewsItems,
          final List<ArticleEntity> firstTrendingNewsList,
          final List<ArticleEntity> secondTrendingNewsList,
          final List<ArticleEntity> thirdTrendingNewsList}) =
      _$DiscoverNewsStateImpl;

  @override
  LoadState get loadState;
  @override
  List<ArticleEntity> get breakingNewsItems;
  @override
  List<ArticleEntity> get firstTrendingNewsList;
  @override
  List<ArticleEntity> get secondTrendingNewsList;
  @override
  List<ArticleEntity> get thirdTrendingNewsList;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverNewsStateImplCopyWith<_$DiscoverNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
