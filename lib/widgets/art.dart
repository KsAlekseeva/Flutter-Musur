import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class CurrentTrackArt extends ConsumerWidget {
  const CurrentTrackArt({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUri = ref.watch(spotifyPlayerStateProvider
        .select((value) => value.playerState?.track?.imageUri));
    if (imageUri == null) {
      return SizedBox(
        width: size,
        height: size,
      );
    }
    return SizedBox(
      width: size,
      height: size,
      child: _SpotifyImage(imageUri: imageUri),
    );
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
      return const SizedBox.shrink();
    }
    return Image.memory(
      _bytes!,
      gaplessPlayback: true,
    );
  }
}
