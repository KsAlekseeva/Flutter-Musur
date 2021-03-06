import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:musur/widgets/inner_shadow.dart';
import 'package:spotify/spotify.dart';
import 'package:go_router/go_router.dart';

class TrackTile extends ConsumerWidget {
  const TrackTile({
    Key? key,
    required this.track,
    this.trailing,
  }) : super(key: key);

  final Track track;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyPlayer = ref.watch(spotifyPlayerProvider);
    final currentTrack = ref.watch(
        spotifyPlayerStateProvider.select((value) => value.playerState?.track));
    final current = track.uri == currentTrack?.uri;

    void handleTap() {
      spotifyPlayer.playTrack(track);
    }

    return GestureDetector(
      onTap: () => context.pushNamed(Routes.nowPlaying),
      child: Container(
        decoration: !current
            ? null
            : BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.38),
                ),
              ),
        child: Neumorphic(
          style: !current
              ? const NeumorphicStyle(
                  depth: 0,
                  color: Colors.transparent,
                  boxShape: NeumorphicBoxShape.rect(),
                )
              : NeumorphicStyle(
                  depth: -4,
                  color: Colors.white.withOpacity(0.1),
                  boxShape: const NeumorphicBoxShape.rect(),
                ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 60,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBase(
                convex: true,
                color: const Color(0xFFCEBEEE),
                child: IconButton(
                  onPressed: handleTap,
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 30,
                  color: AppColors.darkBlue,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    track.name ?? '',
                    style: const TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (trailing != null)
                ButtonBase(
                  color: const Color(0xFFCEBEEE),
                  child: InnerShadow(
                    blur: 4,
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(-2, -2),
                    child: InnerShadow(
                      blur: 4,
                      color: const Color.fromRGBO(30, 38, 53, 0.25),
                      offset: const Offset(2, 2),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFEDBFF4),
                              Color(0xFFC7E9F7),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        child: trailing
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
