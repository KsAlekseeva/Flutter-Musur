import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

final welcomeManagerProvider = Provider(
  (ref) => WelcomeManager(
    ref.watch(prefsProvider),
    ref.watch(welcomeStateProvider),
  ),
);
final welcomeStateProvider = StateProvider(
  (ref) => WelcomeState(
    ref.watch(prefsProvider).value.getBool(_key) ?? false,
  ),
);

const _key = 'seen_welcome';

class WelcomeManager {
  final Prefs _prefs;
  final WelcomeState _state;

  const WelcomeManager(
    this._prefs,
    this._state,
  );

  Future<void> markSeen() async {
    await _prefs.value.setBool(_key, true);
    _state.setSeen(true);
  }
}

class WelcomeState extends StateNotifier<bool> {
  WelcomeState(bool value) : super(value);

  void setSeen(bool value) {
    state = value;
  }
}
