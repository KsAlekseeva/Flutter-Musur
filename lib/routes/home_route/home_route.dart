export 'welcome_screen/welcome_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:musur/musur.dart';

class HomeRoute extends ConsumerWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(contentStateProvider);
    if (!contentState.initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final welcomeManagerState = ref.watch(welcomeStateProvider);
    return StateNotifierBuilder<bool>(
      stateNotifier: welcomeManagerState,
      builder: (context, value, child) {
        if (!value) {
          return const WelcomeScreen();
        }
        return const MyPlaylist();
      },
    );

    // final player = ref.watch(spotifyPlayerProvider);
    // final savedTracks = contentState.savedTracks;
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: savedTracks.length,
    //     itemBuilder: (context, index) {
    //       final track = savedTracks[index].track!;
    //       return ListTile(
    //         title: Text(track.name ?? ''),
    //         onTap: () {
    //           player.playTrack(track);
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}
