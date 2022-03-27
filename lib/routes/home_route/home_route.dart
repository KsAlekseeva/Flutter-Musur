export 'welcome_screen/welcome_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:musur/musur.dart';

class HomeRoute extends ConsumerWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialized =
        ref.watch(contentStateProvider.select((value) => value.initialized));
    if (!initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final welcomeState = ref.watch(welcomeStateProvider);
    if (!welcomeState) {
      return const WelcomeScreen();
    }
    return const MyPlaylist();
  }
}
