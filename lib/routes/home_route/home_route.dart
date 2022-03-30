export 'welcome_screen/welcome_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:musur/musur.dart';

class HomeRoute extends ConsumerWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialized =
        ref.watch(contentStateProvider.select((value) => value.initialized));
    if (!initialized) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    final welcomeState = ref.watch(welcomeStateProvider);
    if (!welcomeState) {
      return const WelcomeScreen();
    }
    return const MyPlaylist();
  }
}
