import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

class MyPlaylist extends StatelessWidget {
  const MyPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      appBar: const ScreenAppBar(
        leading: DrawerButton(),
        title: _CurrentTrack(),
      ),
      child: Column(
        children: [
          _buildArt(context),
          _buildHeader(),
          const Expanded(
            child: _SavedTrackList(),
          ),
        ],
      ),
    );
  }

  Widget _buildArt(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final artSize = screenWidth / 1.75;
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -3,
        color: const Color(0xFFBDF6F7),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(artSize),
        ),
      ),
      child: CurrentTrackArt(
        size: artSize,
      ),
    );
  }

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 33,
          left: 80,
          bottom: 17,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Мои песни',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      );
}

class _CurrentTrack extends ConsumerWidget {
  const _CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTrack = ref.watch(
        spotifyPlayerStateProvider.select((value) => value.playerState?.track));
    return Column(
      children: [
        Text(
          currentTrack?.name ?? '',
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: AppColors.darkBlue,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          currentTrack?.artist.name ?? '',
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: AppColors.darkBlue,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _SavedTrackList extends ConsumerWidget {
  const _SavedTrackList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedTracks =
        ref.watch(contentStateProvider.select((value) => value.savedTracks));
    return ListView.builder(
      itemCount: savedTracks.length,
      itemBuilder: (BuildContext context, int index) {
        return TrackTile(track: savedTracks[index].track!);
      },
    );
  }
}
