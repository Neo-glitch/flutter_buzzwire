// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsDetailsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  bool get isArticleSaved => throw _privateConstructorUsedError;
  List<ArticleEntity> get savedArticles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsDetailsStateCopyWith<NewsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDetailsStateCopyWith<$Res> {
  factory $NewsDetailsStateCopyWith(
          NewsDetailsState value, $Res Function(NewsDetailsState) then) =
      _$NewsDetailsStateCopyWithImpl<$Res, NewsDetailsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      bool isArticleSaved,
      List<ArticleEntity> savedArticles});
}

/// @nodoc
class _$NewsDetailsStateCopyWithImpl<$Res, $Val extends NewsDetailsState>
    implements $NewsDetailsStateCopyWith<$Res> {
  _$NewsDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? isArticleSaved = null,
    Object? savedArticles = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      isArticleSaved: null == isArticleSaved
          ? _value.isArticleSaved
          : isArticleSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      savedArticles: null == savedArticles
          ? _value.savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDetailsStateImplCopyWith<$Res>
    implements $NewsDetailsStateCopyWith<$Res> {
  factory _$$NewsDetailsStateImplCopyWith(_$NewsDetailsStateImpl value,
          $Res Function(_$NewsDetailsStateImpl) then) =
      __$$NewsDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      bool isArticleSaved,
      List<ArticleEntity> savedArticles});
}

/// @nodoc
class __$$NewsDetailsStateImplCopyWithImpl<$Res>
    extends _$NewsDetailsStateCopyWithImpl<$Res, _$NewsDetailsStateImpl>
    implements _$$NewsDetailsStateImplCopyWith<$Res> {
  __$$NewsDetailsStateImplCopyWithImpl(_$NewsDetailsStateImpl _value,
      $Res Function(_$NewsDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? isArticleSaved = null,
    Object? savedArticles = null,
  }) {
    return _then(_$NewsDetailsStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      isArticleSaved: null == isArticleSaved
          ? _value.isArticleSaved
          : isArticleSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      savedArticles: null == savedArticles
          ? _value._savedArticles
          : savedArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ));
  }
}

/// @nodoc

class _$NewsDetailsStateImpl implements _NewsDetailsState {
  const _$NewsDetailsStateImpl(
      {this.loadState = const Empty(),
      this.isArticleSaved = false,
      final List<ArticleEntity> savedArticles = const []})
      : _savedArticles = savedArticles;

  @override
  @JsonKey()
  final LoadState loadState;
  @override
  @JsonKey()
  final bool isArticleSaved;
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
    return 'NewsDetailsState(loadState: $loadState, isArticleSaved: $isArticleSaved, savedArticles: $savedArticles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDetailsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.isArticleSaved, isArticleSaved) ||
                other.isArticleSaved == isArticleSaved) &&
            const DeepCollectionEquality()
                .equals(other._savedArticles, _savedArticles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState, isArticleSaved,
      const DeepCollectionEquality().hash(_savedArticles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDetailsStateImplCopyWith<_$NewsDetailsStateImpl> get copyWith =>
      __$$NewsDetailsStateImplCopyWithImpl<_$NewsDetailsStateImpl>(
          this, _$identity);
}

abstract class _NewsDetailsState implements NewsDetailsState {
  const factory _NewsDetailsState(
      {final LoadState loadState,
      final bool isArticleSaved,
      final List<ArticleEntity> savedArticles}) = _$NewsDetailsStateImpl;

  @override
  LoadState get loadState;
  @override
  bool get isArticleSaved;
  @override
  List<ArticleEntity> get savedArticles;
  @override
  @JsonKey(ignore: true)
  _$$NewsDetailsStateImplCopyWith<_$NewsDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
