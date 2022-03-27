import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_sdk/models/capabilities.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/models/user_status.dart';

part 'spotify_player_state.freezed.dart';

@freezed
class SpotifyPlayerState with _$SpotifyPlayerState {
  factory SpotifyPlayerState({
    Capabilities? capabilities,
    ConnectionStatus? connectionStatus,
    PlayerContext? playerContext,
    PlayerState? playerState,
    UserStatus? userStatus,
  }) = _SpotifyPlayerState;
}
