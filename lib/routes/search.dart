import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:spotify/spotify.dart' hide Page;
import 'package:spotify/spotify.dart' as spotify_page show Page;

class SearchRoute extends ConsumerStatefulWidget {
  const SearchRoute({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchRoute> createState() => _SearchRouteState();
}

class _SearchRouteState extends ConsumerState<SearchRoute> {
  String searchQuery = '';
  bool loading = false;
  final tracks = <Track>[];
  spotify_page.Page? lastPage;

  late final ScrollController scrollController = ScrollController()
    ..addListener(() {
      if (!loading && scrollController.position.extentAfter < endExtentToLoad) {
        _load();
      }
    });
  static const endExtentToLoad = 300;
  late ContentManager contentManager;

  Future<void> _load() async {
    if (lastPage?.isLast ?? false) {
      return;
    }
    final query = searchQuery.trim();
    if (query.isEmpty) {
      return;
    }
    setState(() {
      loading = true;
    });
    final pages = await contentManager.search(query, lastPage?.nextOffset ?? 0);
    final tracksPage = pages[3];
    for (final Track track in tracksPage.items!) {
      tracks.add(track);
    }
    lastPage = tracksPage;
    // Ignore if search query changed during loading
    if (mounted && query == searchQuery) {
      setState(() {
        loading = false;
      });
    }
  }

  void _clearState() {
    lastPage = null;
    tracks.clear();
  }

  void _handleChanged(String value) {
    if (value == searchQuery) {
      return;
    }
    setState(() {
      _clearState();
      searchQuery = value;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    contentManager = ref.watch(contentManagerProvider);
    return ScreenScaffold(
      appBar: const ScreenAppBar(
        leading: DrawerButton(),
        title: Text(
          'Поиск',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: LimitedBox(
              maxWidth: 320,
              child: CupertinoSearchTextField(
                placeholder: 'Введите название песни',
                onChanged: _handleChanged,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: tracks.length + (loading ? 1 : 0),
              itemBuilder: (context, index) {
                if (loading && index == tracks.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
                final track = tracks[index];
                return TrackTile(
                  track: track,
                  trailing: IconButton(
                    onPressed: () => contentManager.saveTrack(track),
                    icon: const Icon(Icons.my_library_add),
                    color: AppColors.darkBlue,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
