import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: MusurApp(),
  ));
}

class MusurApp extends ConsumerStatefulWidget {
  const MusurApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MusurApp> createState() => _MusurAppState();
}

class _MusurAppState extends ConsumerState<MusurApp> {
  @override
  void initState() {
    super.initState();

    // Post framing it, because otherwise go_router might not create the initial home route.
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final prefs = ref.read(prefsProvider);
      await prefs.init();

      final contentManager = ref.read(contentManagerProvider);
      await contentManager.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: MusurConfig.appTitle,
    );
  }
}
