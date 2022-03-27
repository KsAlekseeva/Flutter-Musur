import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify_sdk/models/player_options.dart';
import 'package:spotify_sdk/spotify_sdk.dart' as spotifySdkRepeatMode
    show RepeatMode;

class PlayingRoute extends StatefulWidget {
  const PlayingRoute({Key? key}) : super(key: key);

  @override
  State<PlayingRoute> createState() => _PlayingRouteState();
}

class _PlayingRouteState extends State<PlayingRoute> {
  var seekValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      appBar: const ScreenAppBar(
        leading: DrawerButton(),
        title: Text(
          'Now playing',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: PopButton(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 39, right: 33, left: 33),
            child: _TrackShowcase(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 45, right: 45),
            child: _ActionButtons(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 40, right: 40),
            child: _SeekBar(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 70, right: 70),
            child: _PlaybackButtons(),
          ),
        ],
      ),
    );
  }
}

class _TrackShowcase extends StatelessWidget {
  const _TrackShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final artSize = screenWidth / 1.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            depth: 10,
            color: const Color(0xFFBECDEA),
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(artSize),
            ),
          ),
          child: CurrentTrackArt(size: artSize),
        ),
        const SizedBox(height: 21),
        const _TrackShowcaseTitleAndArtist(),
      ],
    );
  }
}

class _TrackShowcaseTitleAndArtist extends ConsumerWidget {
  const _TrackShowcaseTitleAndArtist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTrack = ref.watch(
        spotifyPlayerStateProvider.select((value) => value.playerState?.track));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTrack?.name ?? '',
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: AppColors.darkBlue,
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          currentTrack?.artist.name ?? '',
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: Color(0xFF59628C),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        _RepeatModeButton(),
        SizedBox(width: 10),
        _ShuffleButton(),
      ],
    );
  }
}

class _RepeatModeButton extends ConsumerWidget {
  const _RepeatModeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyPlayer = ref.watch(spotifyPlayerProvider);
    final repeatMode = ref.watch(spotifyPlayerStateProvider
        .select((value) => value.playerState?.playbackOptions.repeatMode));

    IconData _pickToggleItem() {
      switch (repeatMode ?? RepeatMode.off) {
        case RepeatMode.off:
          return Icons.repeat;
        case RepeatMode.track:
          return Icons.repeat_one;
        case RepeatMode.context:
          return Icons.repeat_on_outlined;
      }
    }

    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          spotifySdkRepeatMode.RepeatMode _iterateRepeatMode() {
            switch (repeatMode ?? RepeatMode.off) {
              case RepeatMode.off:
                return spotifySdkRepeatMode.RepeatMode.track;
              case RepeatMode.track:
                return spotifySdkRepeatMode.RepeatMode.context;
              case RepeatMode.context:
                return spotifySdkRepeatMode.RepeatMode.off;
            }
          }

          spotifyPlayer.setRepeatMode(_iterateRepeatMode());
        },
        icon: Icon(
          _pickToggleItem(),
          size: 24,
        ),
      ),
    );
  }
}

class _ShuffleButton extends ConsumerWidget {
  const _ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyPlayer = ref.watch(spotifyPlayerProvider);
    final isShuffling = ref.watch(spotifyPlayerStateProvider.select(
        (value) => value.playerState?.playbackOptions.isShuffling ?? false));
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: spotifyPlayer.toggleShuffle,
        icon: Icon(
          isShuffling ? Icons.shuffle_on_outlined : Icons.shuffle,
          size: 24,
        ),
      ),
    );
  }
}

class _SeekBar extends ConsumerStatefulWidget {
  const _SeekBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeekBarState();
}

class _SeekBarState extends ConsumerState<_SeekBar> {
  bool seeking = false;
  double localValue = 0;

  void _updateLocal(double value) {
    setState(() {
      localValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final spotifyPlayer = ref.watch(spotifyPlayerProvider);
    final positionSubject = spotifyPlayer.positionSubject;
    final duration = ref.watch(spotifyPlayerStateProvider
        .select((value) => value.playerState?.track?.duration));
    return StreamBuilder<int>(
      initialData: positionSubject.value,
      stream: positionSubject,
      builder: (context, snapshot) {
        final double actualValue =
            duration == null ? 0 : (snapshot.data! / duration).clamp(0.0, 1.0);
        final value = seeking ? localValue : actualValue;
        return NeumorphicSlider(
          height: 14,
          value: value,
          min: 0,
          max: 1,
          onChangeStart: (double value) {
            seeking = true;
            _updateLocal(value);
          },
          onChanged: _updateLocal,
          onChangeEnd: (double value) {
            seeking = false;
            _updateLocal(value);
            if (duration != null) {
              spotifyPlayer.seek((value * duration).toInt());
            }
          },
        );
      },
    );
  }
}

class _PlaybackButtons extends ConsumerWidget {
  const _PlaybackButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyPlayer = ref.watch(spotifyPlayerProvider);
    final paused = ref.watch(spotifyPlayerStateProvider
        .select((value) => value.playerState?.isPaused ?? true));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonBase(
          color: const Color(0xFFDDC0F3),
          child: IconButton(
            icon: const Icon(Icons.skip_previous),
            iconSize: 35,
            color: Colors.black,
            onPressed: spotifyPlayer.skipPrevious,
          ),
        ),
        ButtonBase(
          color: AppColors.darkBlue,
          child: IconButton(
            icon:
                paused ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
            iconSize: 35,
            color: Colors.black,
            onPressed: spotifyPlayer.playPause,
          ),
        ),
        ButtonBase(
          color: const Color(0xFFDDC0F3),
          child: IconButton(
            icon: const Icon(Icons.skip_next),
            iconSize: 35,
            color: Colors.black,
            onPressed: spotifyPlayer.skipNext,
          ),
        ),
      ],
    );
  }
}
