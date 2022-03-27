import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart' hide PlayerContext;
import 'package:spotify_sdk/models/capabilities.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/models/user_status.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:rxdart/rxdart.dart';

final spotifyPlayerProvider = Provider(
  (ref) {
    final player = SpotifyPlayer(
      ref.watch(spotifyApiManagerProvider),
      ref.watch(spotifyPlayerStateProvider.notifier),
    );
    ref.onDispose(player.dipose);
    return player;
  },
);
final spotifyPlayerStateProvider =
    StateNotifierProvider<SpotifyPlayerStateHolder, SpotifyPlayerState>(
  (ref) => SpotifyPlayerStateHolder(),
);

class SpotifyPlayerStateHolder extends StateNotifier<SpotifyPlayerState> {
  SpotifyPlayerStateHolder() : super(SpotifyPlayerState());

  void setCapabilities(Capabilities value) {
    state = state.copyWith(capabilities: value);
  }

  void setConnectionStatus(ConnectionStatus value) {
    state = state.copyWith(connectionStatus: value);
  }

  void setPlayerContext(PlayerContext value) {
    state = state.copyWith(playerContext: value);
  }

  void setPlayerState(PlayerState value) {
    state = state.copyWith(playerState: value);
  }

  void setUserStatus(UserStatus value) {
    state = state.copyWith(userStatus: value);
  }
}

/// Connects to Spotify app player via [SpotifySdk] and allows
/// to control its player.
class SpotifyPlayer {
  final SpotifyApiManager _spotifyApiManager;
  final SpotifyPlayerStateHolder _spotifyPlayerState;

  SpotifyPlayer(
    this._spotifyApiManager,
    this._spotifyPlayerState,
  );

  CompositeSubscription? _subscription;

  Future<void> init() async {
    if (_subscription != null) {
      return;
    }
    _subscription = CompositeSubscription();
    final credentials = await _spotifyApiManager.api.getCredentials();
    await SpotifySdk.connectToSpotifyRemote(
      clientId: MusurConfig.spotifyApiClientId,
      redirectUrl: MusurConfig.spotifyApiRedirectUri,
      scope: MusurConfig.spotifyApiScopes,
      accessToken: credentials.accessToken,
    );
    _subscription!.add(SpotifySdk.subscribeCapabilities()
        .listen(_spotifyPlayerState.setCapabilities));
    _subscription!.add(SpotifySdk.subscribeConnectionStatus()
        .listen(_spotifyPlayerState.setConnectionStatus));
    _subscription!.add(SpotifySdk.subscribePlayerContext()
        .listen(_spotifyPlayerState.setPlayerContext));
    _subscription!.add(SpotifySdk.subscribePlayerState()
        .listen(_spotifyPlayerState.setPlayerState));
    _subscription!.add(SpotifySdk.subscribeUserStatus()
        .listen(_spotifyPlayerState.setUserStatus));
  }

  void dipose() {
    _subscription?.dispose();
    _subscription = null;
  }

  Future<void> playTrack(Track track) async {
    await SpotifySdk.play(spotifyUri: track.uri!);
  }
}
