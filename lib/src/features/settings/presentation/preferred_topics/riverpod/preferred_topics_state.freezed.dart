// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferred_topics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreferredTopicsState {
  LoadState get loadState => throw _privateConstructorUsedError;
  List<TopicEntity> get topics => throw _privateConstructorUsedError;
  List<TopicEntity> get selectedTopics => throw _privateConstructorUsedError;
  bool get isUpdateCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferredTopicsStateCopyWith<PreferredTopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferredTopicsStateCopyWith<$Res> {
  factory $PreferredTopicsStateCopyWith(PreferredTopicsState value,
          $Res Function(PreferredTopicsState) then) =
      _$PreferredTopicsStateCopyWithImpl<$Res, PreferredTopicsState>;
  @useResult
  $Res call(
      {LoadState loadState,
      List<TopicEntity> topics,
      List<TopicEntity> selectedTopics,
      bool isUpdateCompleted});
}

/// @nodoc
class _$PreferredTopicsStateCopyWithImpl<$Res,
        $Val extends PreferredTopicsState>
    implements $PreferredTopicsStateCopyWith<$Res> {
  _$PreferredTopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? topics = null,
    Object? selectedTopics = null,
    Object? isUpdateCompleted = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
      selectedTopics: null == selectedTopics
          ? _value.selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
      isUpdateCompleted: null == isUpdateCompleted
          ? _value.isUpdateCompleted
          : isUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferredTopicsStateImplCopyWith<$Res>
    implements $PreferredTopicsStateCopyWith<$Res> {
  factory _$$PreferredTopicsStateImplCopyWith(_$PreferredTopicsStateImpl value,
          $Res Function(_$PreferredTopicsStateImpl) then) =
      __$$PreferredTopicsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      List<TopicEntity> topics,
      List<TopicEntity> selectedTopics,
      bool isUpdateCompleted});
}

/// @nodoc
class __$$PreferredTopicsStateImplCopyWithImpl<$Res>
    extends _$PreferredTopicsStateCopyWithImpl<$Res, _$PreferredTopicsStateImpl>
    implements _$$PreferredTopicsStateImplCopyWith<$Res> {
  __$$PreferredTopicsStateImplCopyWithImpl(_$PreferredTopicsStateImpl _value,
      $Res Function(_$PreferredTopicsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? topics = null,
    Object? selectedTopics = null,
    Object? isUpdateCompleted = null,
  }) {
    return _then(_$PreferredTopicsStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
      selectedTopics: null == selectedTopics
          ? _value._selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
      isUpdateCompleted: null == isUpdateCompleted
          ? _value.isUpdateCompleted
          : isUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PreferredTopicsStateImpl implements _PreferredTopicsState {
  const _$PreferredTopicsStateImpl(
      {this.loadState = const Empty(),
      final List<TopicEntity> topics = const [],
      final List<TopicEntity> selectedTopics = const [],
      this.isUpdateCompleted = false})
      : _topics = topics,
        _selectedTopics = selectedTopics;

  @override
  @JsonKey()
  final LoadState loadState;
  final List<TopicEntity> _topics;
  @override
  @JsonKey()
  List<TopicEntity> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  final List<TopicEntity> _selectedTopics;
  @override
  @JsonKey()
  List<TopicEntity> get selectedTopics {
    if (_selectedTopics is EqualUnmodifiableListView) return _selectedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTopics);
  }

  @override
  @JsonKey()
  final bool isUpdateCompleted;

  @override
  String toString() {
    return 'PreferredTopicsState(loadState: $loadState, topics: $topics, selectedTopics: $selectedTopics, isUpdateCompleted: $isUpdateCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferredTopicsStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            const DeepCollectionEquality()
                .equals(other._selectedTopics, _selectedTopics) &&
            (identical(other.isUpdateCompleted, isUpdateCompleted) ||
                other.isUpdateCompleted == isUpdateCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadState,
      const DeepCollectionEquality().hash(_topics),
      const DeepCollectionEquality().hash(_selectedTopics),
      isUpdateCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferredTopicsStateImplCopyWith<_$PreferredTopicsStateImpl>
      get copyWith =>
          __$$PreferredTopicsStateImplCopyWithImpl<_$PreferredTopicsStateImpl>(
              this, _$identity);
}

abstract class _PreferredTopicsState implements PreferredTopicsState {
  const factory _PreferredTopicsState(
      {final LoadState loadState,
      final List<TopicEntity> topics,
      final List<TopicEntity> selectedTopics,
      final bool isUpdateCompleted}) = _$PreferredTopicsStateImpl;

  @override
  LoadState get loadState;
  @override
  List<TopicEntity> get topics;
  @override
  List<TopicEntity> get selectedTopics;
  @override
  bool get isUpdateCompleted;
  @override
  @JsonKey(ignore: true)
  _$$PreferredTopicsStateImplCopyWith<_$PreferredTopicsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
