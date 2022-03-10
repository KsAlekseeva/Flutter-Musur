import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

final contentStateProvider =
    StateNotifierProvider<ContentStateHolder, ContentState>(
  (ref) => ContentStateHolder(),
);
final contentManagerProvider = Provider(
  (ref) => ContentManager(
    ref.watch(contentStateProvider.notifier),
    ref.watch(spotifyApiManagerProvider),
    ref.watch(spotifyPlayerProvider),
  ),
);

class ContentStateHolder extends StateNotifier<ContentState> {
  ContentStateHolder() : super(ContentState());

  setInitilized(bool initialized) {
    state = state.copyWith(
      initialized: initialized,
    );
  }

  setSavedTracks(List<TrackSaved> tracks) {
    state = state.copyWith(savedTracks: tracks);
  }
}

class ContentManager {
  final ContentStateHolder _contentState;
  final SpotifyApiManager _spotifyApiManager;
  final SpotifyPlayer _spotifyPlayer;

  ContentManager(
    this._contentState,
    this._spotifyApiManager,
    this._spotifyPlayer,
  );

  Future<void> init() async {
    await _spotifyApiManager.init();
    await _spotifyPlayer.init();
    final tracks = await _spotifyApiManager.api.tracks.me.saved.all();
    _contentState.setSavedTracks(tracks.toList());
    _contentState.setInitilized(true);
  }
}
