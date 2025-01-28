// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsDetailState {
  ArticleEntity? get article => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsDetailStateCopyWith<NewsDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDetailStateCopyWith<$Res> {
  factory $NewsDetailStateCopyWith(
          NewsDetailState value, $Res Function(NewsDetailState) then) =
      _$NewsDetailStateCopyWithImpl<$Res, NewsDetailState>;
  @useResult
  $Res call({ArticleEntity? article});
}

/// @nodoc
class _$NewsDetailStateCopyWithImpl<$Res, $Val extends NewsDetailState>
    implements $NewsDetailStateCopyWith<$Res> {
  _$NewsDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(_value.copyWith(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDetailStateImplCopyWith<$Res>
    implements $NewsDetailStateCopyWith<$Res> {
  factory _$$NewsDetailStateImplCopyWith(_$NewsDetailStateImpl value,
          $Res Function(_$NewsDetailStateImpl) then) =
      __$$NewsDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ArticleEntity? article});
}

/// @nodoc
class __$$NewsDetailStateImplCopyWithImpl<$Res>
    extends _$NewsDetailStateCopyWithImpl<$Res, _$NewsDetailStateImpl>
    implements _$$NewsDetailStateImplCopyWith<$Res> {
  __$$NewsDetailStateImplCopyWithImpl(
      _$NewsDetailStateImpl _value, $Res Function(_$NewsDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(_$NewsDetailStateImpl(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleEntity?,
    ));
  }
}

/// @nodoc

class _$NewsDetailStateImpl implements _NewsDetailState {
  const _$NewsDetailStateImpl({this.article});

  @override
  final ArticleEntity? article;

  @override
  String toString() {
    return 'NewsDetailState(article: $article)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDetailStateImpl &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDetailStateImplCopyWith<_$NewsDetailStateImpl> get copyWith =>
      __$$NewsDetailStateImplCopyWithImpl<_$NewsDetailStateImpl>(
          this, _$identity);
}

abstract class _NewsDetailState implements NewsDetailState {
  const factory _NewsDetailState({final ArticleEntity? article}) =
      _$NewsDetailStateImpl;

  @override
  ArticleEntity? get article;
  @override
  @JsonKey(ignore: true)
  _$$NewsDetailStateImplCopyWith<_$NewsDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
