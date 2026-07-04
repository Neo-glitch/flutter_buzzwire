// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_detail_webview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsDetailWebViewState {
  LoadState get loadState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsDetailWebViewStateCopyWith<NewsDetailWebViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDetailWebViewStateCopyWith<$Res> {
  factory $NewsDetailWebViewStateCopyWith(NewsDetailWebViewState value,
          $Res Function(NewsDetailWebViewState) then) =
      _$NewsDetailWebViewStateCopyWithImpl<$Res, NewsDetailWebViewState>;
  @useResult
  $Res call({LoadState loadState});
}

/// @nodoc
class _$NewsDetailWebViewStateCopyWithImpl<$Res,
        $Val extends NewsDetailWebViewState>
    implements $NewsDetailWebViewStateCopyWith<$Res> {
  _$NewsDetailWebViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDetailWebViewStateImplCopyWith<$Res>
    implements $NewsDetailWebViewStateCopyWith<$Res> {
  factory _$$NewsDetailWebViewStateImplCopyWith(
          _$NewsDetailWebViewStateImpl value,
          $Res Function(_$NewsDetailWebViewStateImpl) then) =
      __$$NewsDetailWebViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadState loadState});
}

/// @nodoc
class __$$NewsDetailWebViewStateImplCopyWithImpl<$Res>
    extends _$NewsDetailWebViewStateCopyWithImpl<$Res,
        _$NewsDetailWebViewStateImpl>
    implements _$$NewsDetailWebViewStateImplCopyWith<$Res> {
  __$$NewsDetailWebViewStateImplCopyWithImpl(
      _$NewsDetailWebViewStateImpl _value,
      $Res Function(_$NewsDetailWebViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
  }) {
    return _then(_$NewsDetailWebViewStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ));
  }
}

/// @nodoc

class _$NewsDetailWebViewStateImpl implements _NewsDetailWebViewState {
  const _$NewsDetailWebViewStateImpl({this.loadState = const Empty()});

  @override
  @JsonKey()
  final LoadState loadState;

  @override
  String toString() {
    return 'NewsDetailWebViewState(loadState: $loadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDetailWebViewStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDetailWebViewStateImplCopyWith<_$NewsDetailWebViewStateImpl>
      get copyWith => __$$NewsDetailWebViewStateImplCopyWithImpl<
          _$NewsDetailWebViewStateImpl>(this, _$identity);
}

abstract class _NewsDetailWebViewState implements NewsDetailWebViewState {
  const factory _NewsDetailWebViewState({final LoadState loadState}) =
      _$NewsDetailWebViewStateImpl;

  @override
  LoadState get loadState;
  @override
  @JsonKey(ignore: true)
  _$$NewsDetailWebViewStateImplCopyWith<_$NewsDetailWebViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
