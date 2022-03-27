// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spotify_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpotifyPlayerStateTearOff {
  const _$SpotifyPlayerStateTearOff();

  _SpotifyPlayerState call(
      {Capabilities? capabilities,
      ConnectionStatus? connectionStatus,
      PlayerContext? playerContext,
      PlayerState? playerState,
      UserStatus? userStatus}) {
    return _SpotifyPlayerState(
      capabilities: capabilities,
      connectionStatus: connectionStatus,
      playerContext: playerContext,
      playerState: playerState,
      userStatus: userStatus,
    );
  }
}

/// @nodoc
const $SpotifyPlayerState = _$SpotifyPlayerStateTearOff();

/// @nodoc
mixin _$SpotifyPlayerState {
  Capabilities? get capabilities => throw _privateConstructorUsedError;
  ConnectionStatus? get connectionStatus => throw _privateConstructorUsedError;
  PlayerContext? get playerContext => throw _privateConstructorUsedError;
  PlayerState? get playerState => throw _privateConstructorUsedError;
  UserStatus? get userStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpotifyPlayerStateCopyWith<SpotifyPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotifyPlayerStateCopyWith<$Res> {
  factory $SpotifyPlayerStateCopyWith(
          SpotifyPlayerState value, $Res Function(SpotifyPlayerState) then) =
      _$SpotifyPlayerStateCopyWithImpl<$Res>;
  $Res call(
      {Capabilities? capabilities,
      ConnectionStatus? connectionStatus,
      PlayerContext? playerContext,
      PlayerState? playerState,
      UserStatus? userStatus});
}

/// @nodoc
class _$SpotifyPlayerStateCopyWithImpl<$Res>
    implements $SpotifyPlayerStateCopyWith<$Res> {
  _$SpotifyPlayerStateCopyWithImpl(this._value, this._then);

  final SpotifyPlayerState _value;
  // ignore: unused_field
  final $Res Function(SpotifyPlayerState) _then;

  @override
  $Res call({
    Object? capabilities = freezed,
    Object? connectionStatus = freezed,
    Object? playerContext = freezed,
    Object? playerState = freezed,
    Object? userStatus = freezed,
  }) {
    return _then(_value.copyWith(
      capabilities: capabilities == freezed
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as Capabilities?,
      connectionStatus: connectionStatus == freezed
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus?,
      playerContext: playerContext == freezed
          ? _value.playerContext
          : playerContext // ignore: cast_nullable_to_non_nullable
              as PlayerContext?,
      playerState: playerState == freezed
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
      userStatus: userStatus == freezed
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
    ));
  }
}

/// @nodoc
abstract class _$SpotifyPlayerStateCopyWith<$Res>
    implements $SpotifyPlayerStateCopyWith<$Res> {
  factory _$SpotifyPlayerStateCopyWith(
          _SpotifyPlayerState value, $Res Function(_SpotifyPlayerState) then) =
      __$SpotifyPlayerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Capabilities? capabilities,
      ConnectionStatus? connectionStatus,
      PlayerContext? playerContext,
      PlayerState? playerState,
      UserStatus? userStatus});
}

/// @nodoc
class __$SpotifyPlayerStateCopyWithImpl<$Res>
    extends _$SpotifyPlayerStateCopyWithImpl<$Res>
    implements _$SpotifyPlayerStateCopyWith<$Res> {
  __$SpotifyPlayerStateCopyWithImpl(
      _SpotifyPlayerState _value, $Res Function(_SpotifyPlayerState) _then)
      : super(_value, (v) => _then(v as _SpotifyPlayerState));

  @override
  _SpotifyPlayerState get _value => super._value as _SpotifyPlayerState;

  @override
  $Res call({
    Object? capabilities = freezed,
    Object? connectionStatus = freezed,
    Object? playerContext = freezed,
    Object? playerState = freezed,
    Object? userStatus = freezed,
  }) {
    return _then(_SpotifyPlayerState(
      capabilities: capabilities == freezed
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as Capabilities?,
      connectionStatus: connectionStatus == freezed
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus?,
      playerContext: playerContext == freezed
          ? _value.playerContext
          : playerContext // ignore: cast_nullable_to_non_nullable
              as PlayerContext?,
      playerState: playerState == freezed
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
      userStatus: userStatus == freezed
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
    ));
  }
}

/// @nodoc

class _$_SpotifyPlayerState implements _SpotifyPlayerState {
  _$_SpotifyPlayerState(
      {this.capabilities,
      this.connectionStatus,
      this.playerContext,
      this.playerState,
      this.userStatus});

  @override
  final Capabilities? capabilities;
  @override
  final ConnectionStatus? connectionStatus;
  @override
  final PlayerContext? playerContext;
  @override
  final PlayerState? playerState;
  @override
  final UserStatus? userStatus;

  @override
  String toString() {
    return 'SpotifyPlayerState(capabilities: $capabilities, connectionStatus: $connectionStatus, playerContext: $playerContext, playerState: $playerState, userStatus: $userStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotifyPlayerState &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            const DeepCollectionEquality()
                .equals(other.connectionStatus, connectionStatus) &&
            const DeepCollectionEquality()
                .equals(other.playerContext, playerContext) &&
            const DeepCollectionEquality()
                .equals(other.playerState, playerState) &&
            const DeepCollectionEquality()
                .equals(other.userStatus, userStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(capabilities),
      const DeepCollectionEquality().hash(connectionStatus),
      const DeepCollectionEquality().hash(playerContext),
      const DeepCollectionEquality().hash(playerState),
      const DeepCollectionEquality().hash(userStatus));

  @JsonKey(ignore: true)
  @override
  _$SpotifyPlayerStateCopyWith<_SpotifyPlayerState> get copyWith =>
      __$SpotifyPlayerStateCopyWithImpl<_SpotifyPlayerState>(this, _$identity);
}

abstract class _SpotifyPlayerState implements SpotifyPlayerState {
  factory _SpotifyPlayerState(
      {Capabilities? capabilities,
      ConnectionStatus? connectionStatus,
      PlayerContext? playerContext,
      PlayerState? playerState,
      UserStatus? userStatus}) = _$_SpotifyPlayerState;

  @override
  Capabilities? get capabilities;
  @override
  ConnectionStatus? get connectionStatus;
  @override
  PlayerContext? get playerContext;
  @override
  PlayerState? get playerState;
  @override
  UserStatus? get userStatus;
  @override
  @JsonKey(ignore: true)
  _$SpotifyPlayerStateCopyWith<_SpotifyPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
