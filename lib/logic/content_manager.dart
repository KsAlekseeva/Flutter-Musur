import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart';

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

  void setInitilized(bool initialized) {
    state = state.copyWith(
      initialized: initialized,
    );
  }

  void setSavedTracks(List<TrackSaved> tracks) {
    state = state.copyWith(savedTracks: tracks);
  }

  void addSavedTrack(TrackSaved track) {
    final copied = state.savedTracks.toList();
    copied.insert(0, track);
    state = state.copyWith(savedTracks: copied);
  }

  void removeSavedTrack(TrackSaved track) {
    final copied = state.savedTracks.toList();
    copied.remove(track);
    state = state.copyWith(savedTracks: copied);
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

  static const _searchLimit = 30;
  Future<List<Page<dynamic>>> search(String query, int offset) {
    return _spotifyApiManager.api.search.get(query).getPage(
          _searchLimit,
          offset,
        );
  }

  Future<void> saveTrack(Track track) async {
    await _spotifyApiManager.api.tracks.me.saveOne(track.id!);
    _contentState.addSavedTrack(
      TrackSaved()
        ..track = track
        ..addedAt = DateTime.now(),
    );
  }

  Future<void> removeTrack(TrackSaved track) async {
    await _spotifyApiManager.api.tracks.me.removeOne(track.track!.id!);
    _contentState.removeSavedTrack(track);
  }
}
