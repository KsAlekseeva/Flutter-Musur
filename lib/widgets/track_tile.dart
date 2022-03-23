import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart';
import 'package:go_router/go_router.dart';

class TrackTile extends StatefulWidget {
  const TrackTile({
    Key? key,
    // required this.track,
  }) : super(key: key);

  // final Track track;

  @override
  _TrackTileState createState() => _TrackTileState();
}

class _TrackTileState extends State<TrackTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.nowPlaying),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                depth: 4,
                color: const Color(0xFFCEBEEE),
                boxShape: NeumorphicBoxShape.roundRect(
                  const BorderRadius.all(Radius.circular(100)),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                iconSize: 30,
                color: AppColors.darkBlue,
              ),
            ),
            const Text(
              "My song",
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Neumorphic(
              style: NeumorphicStyle(
                depth: -2,
                color: const Color(0xFFCEBEEE),
                boxShape: NeumorphicBoxShape.roundRect(
                  const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                iconSize: 30,
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
