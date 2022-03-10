import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

final spotifyPlayerProvider = Provider(
  (ref) => SpotifyPlayer(
    ref.watch(spotifyApiManagerProvider),
  ),
);

/// Connects to Spotify app player via [SpotifySdk] and allows
/// to control its player.
class SpotifyPlayer {
  final SpotifyApiManager _spotifyApiManager;

  SpotifyPlayer(this._spotifyApiManager);

  Future<void> init() async {
    final credentials = await _spotifyApiManager.api.getCredentials();
    await SpotifySdk.connectToSpotifyRemote(
      clientId: MusurConfig.spotifyApiClientId,
      redirectUrl: MusurConfig.spotifyApiRedirectUri,
      scope: MusurConfig.spotifyApiScopes,
      accessToken: credentials.accessToken,
    );
  }

  Future<void> playTrack(Track track) async {
    await SpotifySdk.play(spotifyUri: track.uri!);
  }
}
