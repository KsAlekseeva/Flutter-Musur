import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';
import 'package:musur/routes/my_playlist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      "My playlist": (context) => const MyPlaylist(),
    },
    home: HomeRoute(),
  ),),);
}

class MusurApp extends ConsumerStatefulWidget {
  const MusurApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MusurApp> createState() => _MusurAppState();
}

class _MusurAppState extends ConsumerState<MusurApp> {
  static const _appTitle = 'Musur';

  @override
  void initState() {
    super.initState();

    // Post framing it, because otherwise go_router might not create the initial home route.
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final prefs = ref.read(prefsProvider);
      prefs.init();

      final contentManager = ref.read(contentManagerProvider);
      contentManager.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: _appTitle,
    );
  }
}
