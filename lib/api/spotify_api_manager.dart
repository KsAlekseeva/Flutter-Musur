import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart';

final spotifyApiManagerProvider = Provider(
  (ref) => SpotifyApiManager(
    ref.watch(prefsProvider),
  ),
);

/// Initializes [SpotifyApi] and [SpotifySdk].
class SpotifyApiManager {
  final Prefs _prefs;

  SpotifyApiManager(this._prefs);

  SpotifyApi? _api;
  SpotifyApi get api => _api!;

  Future<void> init() async {
    assert(_api == null);
    final accessToken = await _authenticate();
    if (accessToken != null) {
      _api = SpotifyApi.withAccessToken(accessToken);
    } else {
      throw StateError("Couldn't initalize API");
    }
  }

  /// Returns access token.
  Future<String?> _authenticate() async {
    try {
      final accessToken = await SpotifySdk.getAuthenticationToken(
        clientId: MusurConfig.spotifyApiClientId,
        redirectUrl: MusurConfig.spotifyApiRedirectUri,
        scope: MusurConfig.spotifyApiScopes,
      );
      // TODO: handle token restoration, perhaps store it to prefs. See `spotify_sdk`/`spotify` packages READMEs
      return accessToken;
    } on PlatformException catch (ex) {
      switch (ex.code) {
        case 'SpotifyDisconnectedException':
          rethrow;
        case 'CouldNotFindSpotifyApp':
          _openSpotifyAppPageInStores();
          return null;
        case 'AuthenticationFailedException':
        case 'UserNotAuthorizedException':
        case 'UnsupportedFeatureVersionException':
        case 'OfflineModeException':
        case 'NotLoggedInException':
        case 'SpotifyRemoteServiceException':
        default:
          rethrow;
      }
    }
  }

  void _openSpotifyAppPageInStores() {
    if (Platform.isAndroid) {
      const spotifyPackageName = 'com.spotify.music';
      try {
        launch('market://details?id=$spotifyPackageName');
      } catch (e) {
        launch(
            'https://play.google.com/store/apps/details?id=$spotifyPackageName');
      }
    } else if (Platform.isIOS) {
      // TODO: this is untested
      launch(
        'itms-apps://itunes.apple.com/app/spotify-new-music-and-podcasts/id324684580',
      );
    } else {
      throw UnimplementedError();
    }
  }
}
