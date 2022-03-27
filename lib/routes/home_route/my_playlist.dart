import 'dart:typed_data';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:musur/musur.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

double _artMaxSize(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth / 1.5;
}

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      constraints: BoxConstraints(
        maxWidth: _artMaxSize(context),
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -3,
          color: const Color(0xFFBDF6F7),
          boxShape: NeumorphicBoxShape.roundRect(
            const BorderRadius.all(Radius.circular(1000.0)),
          ),
        ),
        child: const _CurrentTrackArt(),
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
    final spotifyPlayerState = ref.watch(spotifyPlayerStateProvider);
    return Column(
      children: [
        Text(
          spotifyPlayerState.playerState?.track?.name ?? '',
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
          spotifyPlayerState.playerState?.track?.artist.name ?? '',
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

class _StubArt extends StatelessWidget {
  const _StubArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxSize = _artMaxSize(context);
    return SizedBox(
      width: maxSize,
      height: maxSize,
    );
  }
}

class _CurrentTrackArt extends ConsumerWidget {
  const _CurrentTrackArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyPlayerState = ref.watch(spotifyPlayerStateProvider);
    final imageUri = spotifyPlayerState.playerState?.track?.imageUri;
    if (imageUri == null) {
      return const _StubArt();
    }
    return _SpotifyImage(imageUri: imageUri);
  }
}

class _SpotifyImage extends StatefulWidget {
  const _SpotifyImage({
    Key? key,
    required this.imageUri,
  }) : super(key: key);

  final ImageUri? imageUri;

  @override
  State<_SpotifyImage> createState() => _SpotifyImageState();
}

class _SpotifyImageState extends State<_SpotifyImage> {
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _SpotifyImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUri?.raw != widget.imageUri?.raw) {
      _load();
    }
  }

  Future<void> _load() async {
    final imageUri = widget.imageUri;
    if (imageUri != null) {
      final bytes = await SpotifySdk.getImage(imageUri: imageUri);
      if (mounted) {
        setState(() {
          _bytes = bytes;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes == null) {
      return const _StubArt();
    }
    return Image.memory(_bytes!);
  }
}

class _SavedTrackList extends ConsumerWidget {
  const _SavedTrackList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(contentStateProvider);
    final savedTracks = contentState.savedTracks;
    return ListView.builder(
      itemCount: savedTracks.length,
      itemBuilder: (BuildContext context, int index) {
        return TrackTile(track: savedTracks[index].track!);
      },
    );
  }
}
