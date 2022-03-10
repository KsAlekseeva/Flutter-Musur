import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart';

part 'content_state.freezed.dart';

@freezed
class ContentState with _$ContentState {
  factory ContentState({
    @Default(false) bool initialized,
    @Default([]) List<TrackSaved> savedTracks,
  }) = _ContentState;
}
