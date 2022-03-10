import 'package:spotify/spotify.dart';

class MusurConfig {
  MusurConfig._();

  // Account nt4f04und@gmail.com
  static const spotifyApiClientId = 'e1176f5de1e04acbbcb243bfd88e6598';
  static final spotifyApiCredentials = SpotifyApiCredentials(
    spotifyApiClientId,
    // Use Proof Key for Code Exchange (PKCE) by omitting client secret.
    // This is undocumented, but works https://github.com/rinukkusu/spotify-dart/issues/81
    null,
  );
  static const spotifyApiRedirectUri = 'https://localhost/';

  // See https://developer.spotify.com/documentation/general/guides/scopes/
  // for a complete list of these Spotify authorization permissions. If no
  // scopes are specified, only public Spotify information will be available.
  static final spotifyApiScopes = const [
    // Images
    // 'ugc-image-upload',
    // Spotify Connect
    'user-read-playback-state',
    'user-modify-playback-state',
    'user-read-currently-playing',
    // Users
    'user-read-private',
    'user-read-email',
    // Follow
    'user-follow-modify',
    'user-follow-read',
    // Library
    'user-library-modify',
    'user-library-read',
    // Playback
    'streaming',
    'app-remote-control',
    // Listening History
    'user-read-playback-position',
    'user-top-read',
    'user-read-recently-played',
    // Playlists
    'playlist-modify-private',
    'playlist-read-collaborative',
    'playlist-read-private',
    'playlist-modify-public',
  ].join(' ');
}
