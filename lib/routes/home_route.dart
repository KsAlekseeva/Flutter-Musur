import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/routes/my_playlist.dart';
import 'package:musur/routes/now_playing.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spotify/spotify.dart' hide Image;

import 'package:musur/musur.dart';

import 'favourites.dart';

class HomeRoute extends ConsumerWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(contentStateProvider);
    final player = ref.watch(spotifyPlayerProvider);
    if (!contentState.initialized) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: [
                  Color(0xFFE1B2F2),
                  Color(0xFFA2C3E1),
                  Color(0xFFC1FFFB),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 50, right: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/yoga.png',
                          height: 300,
                          width: 300,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 60, left: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          color: Color(0xFFB5CAE7),
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(32)),
                          depth: 10,
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Color(0xFFE1B2F2),
                          shadowDarkColor: Color(0xFF5E64DD),
                        ),
                        child: Text(
                          ' Welcome to \n     our app',
                          style: TextStyle(
                              color: Color(0xFF313D69),
                              fontSize: 35,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPlaylist(),
                            ),
                          ),
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
