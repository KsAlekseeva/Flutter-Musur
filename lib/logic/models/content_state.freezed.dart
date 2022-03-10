// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ContentStateTearOff {
  const _$ContentStateTearOff();

  _ContentState call(
      {bool initialized = false, List<TrackSaved> savedTracks = const []}) {
    return _ContentState(
      initialized: initialized,
      savedTracks: savedTracks,
    );
  }
}

/// @nodoc
const $ContentState = _$ContentStateTearOff();

/// @nodoc
mixin _$ContentState {
  bool get initialized => throw _privateConstructorUsedError;
  List<TrackSaved> get savedTracks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentStateCopyWith<ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStateCopyWith<$Res> {
  factory $ContentStateCopyWith(
          ContentState value, $Res Function(ContentState) then) =
      _$ContentStateCopyWithImpl<$Res>;
  $Res call({bool initialized, List<TrackSaved> savedTracks});
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res> implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  final ContentState _value;
  // ignore: unused_field
  final $Res Function(ContentState) _then;

  @override
  $Res call({
    Object? initialized = freezed,
    Object? savedTracks = freezed,
  }) {
    return _then(_value.copyWith(
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      savedTracks: savedTracks == freezed
          ? _value.savedTracks
          : savedTracks // ignore: cast_nullable_to_non_nullable
              as List<TrackSaved>,
    ));
  }
}

/// @nodoc
abstract class _$ContentStateCopyWith<$Res>
    implements $ContentStateCopyWith<$Res> {
  factory _$ContentStateCopyWith(
          _ContentState value, $Res Function(_ContentState) then) =
      __$ContentStateCopyWithImpl<$Res>;
  @override
  $Res call({bool initialized, List<TrackSaved> savedTracks});
}

/// @nodoc
class __$ContentStateCopyWithImpl<$Res> extends _$ContentStateCopyWithImpl<$Res>
    implements _$ContentStateCopyWith<$Res> {
  __$ContentStateCopyWithImpl(
      _ContentState _value, $Res Function(_ContentState) _then)
      : super(_value, (v) => _then(v as _ContentState));

  @override
  _ContentState get _value => super._value as _ContentState;

  @override
  $Res call({
    Object? initialized = freezed,
    Object? savedTracks = freezed,
  }) {
    return _then(_ContentState(
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      savedTracks: savedTracks == freezed
          ? _value.savedTracks
          : savedTracks // ignore: cast_nullable_to_non_nullable
              as List<TrackSaved>,
    ));
  }
}

/// @nodoc

class _$_ContentState implements _ContentState {
  _$_ContentState({this.initialized = false, this.savedTracks = const []});

  @JsonKey()
  @override
  final bool initialized;
  @JsonKey()
  @override
  final List<TrackSaved> savedTracks;

  @override
  String toString() {
    return 'ContentState(initialized: $initialized, savedTracks: $savedTracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentState &&
            const DeepCollectionEquality()
                .equals(other.initialized, initialized) &&
            const DeepCollectionEquality()
                .equals(other.savedTracks, savedTracks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialized),
      const DeepCollectionEquality().hash(savedTracks));

  @JsonKey(ignore: true)
  @override
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      __$ContentStateCopyWithImpl<_ContentState>(this, _$identity);
}

abstract class _ContentState implements ContentState {
  factory _ContentState({bool initialized, List<TrackSaved> savedTracks}) =
      _$_ContentState;

  @override
  bool get initialized;
  @override
  List<TrackSaved> get savedTracks;
  @override
  @JsonKey(ignore: true)
  _$ContentStateCopyWith<_ContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
