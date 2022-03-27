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
  final positionSubject = BehaviorSubject<int>.seeded(0);
  Timer? _positionTimer;

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
    _subscription!.add(SpotifySdk.subscribePlayerState().listen((event) {
      _spotifyPlayerState.setPlayerState(event);
      positionSubject.add(event.playbackPosition);
      if (event.isPaused) {
        _stopPosition();
      } else {
        _startPosition();
      }
    }));
    _subscription!.add(SpotifySdk.subscribeUserStatus()
        .listen(_spotifyPlayerState.setUserStatus));
  }

  void dipose() {
    _subscription?.dispose();
    _subscription = null;
  }

  void _startPosition() {
    if (_positionTimer == null) {
      const interval = Duration(milliseconds: 100);
      _positionTimer = Timer.periodic(interval, (timer) {
        positionSubject.add(positionSubject.value + interval.inMilliseconds);
      });
    }
  }

  void _stopPosition() {
    _positionTimer?.cancel();
    _positionTimer = null;
  }

  Future<void> playTrack(Track track) async {
    await SpotifySdk.play(spotifyUri: track.uri!);
  }

  Future<void> playPause() async {
    final state = await SpotifySdk.getPlayerState();
    if (state == null) {
      return;
    }
    if (state.isPaused) {
      SpotifySdk.resume();
    } else {
      SpotifySdk.pause();
    }
  }

  Future<void> skipPrevious() {
    return SpotifySdk.skipPrevious();
  }

  Future<void> skipNext() {
    return SpotifySdk.skipNext();
  }

  Future<void> seek(int milliseconds) {
    return SpotifySdk.seekTo(positionedMilliseconds: milliseconds);
  }

  // TODO: toggle is buggy, report this here https://github.com/brim-borium/spotify_sdk/issues/new/
  // Future<void> toggleRepeat() {
  //   return SpotifySdk.toggleRepeat();
  // }
  Future<void> setRepeatMode(RepeatMode value) {
    return SpotifySdk.setRepeatMode(repeatMode: value);
  }

  Future<void> toggleShuffle() {
    return SpotifySdk.toggleShuffle();
  }
}
