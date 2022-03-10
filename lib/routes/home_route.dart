import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

class HomeRoute extends ConsumerWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(contentStateProvider);
    final player = ref.watch(spotifyPlayerProvider);
    if (!contentState.initialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final savedTracks = contentState.savedTracks;
    return Scaffold(
      body: ListView.builder(
        itemCount: savedTracks.length,
        itemBuilder: (context, index) {
          final track = savedTracks[index].track!;
          return ListTile(
            title: Text(track.name ?? ''),
            onTap: () {
              player.playTrack(track);
            },
          );
        },
      ),
    );
  }
}
