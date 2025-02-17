// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferred_topics_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreferredTopicsSetupState {
  LoadState get loadState => throw _privateConstructorUsedError;
  List<TopicEntity> get topics => throw _privateConstructorUsedError;
  List<TopicEntity> get selectedTopics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferredTopicsSetupStateCopyWith<PreferredTopicsSetupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferredTopicsSetupStateCopyWith<$Res> {
  factory $PreferredTopicsSetupStateCopyWith(PreferredTopicsSetupState value,
          $Res Function(PreferredTopicsSetupState) then) =
      _$PreferredTopicsSetupStateCopyWithImpl<$Res, PreferredTopicsSetupState>;
  @useResult
  $Res call(
      {LoadState loadState,
      List<TopicEntity> topics,
      List<TopicEntity> selectedTopics});
}

/// @nodoc
class _$PreferredTopicsSetupStateCopyWithImpl<$Res,
        $Val extends PreferredTopicsSetupState>
    implements $PreferredTopicsSetupStateCopyWith<$Res> {
  _$PreferredTopicsSetupStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferredTopicsSetupStateImplCopyWith<$Res>
    implements $PreferredTopicsSetupStateCopyWith<$Res> {
  factory _$$PreferredTopicsSetupStateImplCopyWith(
          _$PreferredTopicsSetupStateImpl value,
          $Res Function(_$PreferredTopicsSetupStateImpl) then) =
      __$$PreferredTopicsSetupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      List<TopicEntity> topics,
      List<TopicEntity> selectedTopics});
}

/// @nodoc
class __$$PreferredTopicsSetupStateImplCopyWithImpl<$Res>
    extends _$PreferredTopicsSetupStateCopyWithImpl<$Res,
        _$PreferredTopicsSetupStateImpl>
    implements _$$PreferredTopicsSetupStateImplCopyWith<$Res> {
  __$$PreferredTopicsSetupStateImplCopyWithImpl(
      _$PreferredTopicsSetupStateImpl _value,
      $Res Function(_$PreferredTopicsSetupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? topics = null,
    Object? selectedTopics = null,
  }) {
    return _then(_$PreferredTopicsSetupStateImpl(
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
    ));
  }
}

/// @nodoc

class _$PreferredTopicsSetupStateImpl implements _PreferredTopicsSetupState {
  const _$PreferredTopicsSetupStateImpl(
      {this.loadState = const Empty(),
      final List<TopicEntity> topics = const [],
      final List<TopicEntity> selectedTopics = const []})
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
  String toString() {
    return 'PreferredTopicsSetupState(loadState: $loadState, topics: $topics, selectedTopics: $selectedTopics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferredTopicsSetupStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            const DeepCollectionEquality()
                .equals(other._selectedTopics, _selectedTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadState,
      const DeepCollectionEquality().hash(_topics),
      const DeepCollectionEquality().hash(_selectedTopics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferredTopicsSetupStateImplCopyWith<_$PreferredTopicsSetupStateImpl>
      get copyWith => __$$PreferredTopicsSetupStateImplCopyWithImpl<
          _$PreferredTopicsSetupStateImpl>(this, _$identity);
}

abstract class _PreferredTopicsSetupState implements PreferredTopicsSetupState {
  const factory _PreferredTopicsSetupState(
          {final LoadState loadState,
          final List<TopicEntity> topics,
          final List<TopicEntity> selectedTopics}) =
      _$PreferredTopicsSetupStateImpl;

  @override
  LoadState get loadState;
  @override
  List<TopicEntity> get topics;
  @override
  List<TopicEntity> get selectedTopics;
  @override
  @JsonKey(ignore: true)
  _$$PreferredTopicsSetupStateImplCopyWith<_$PreferredTopicsSetupStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
