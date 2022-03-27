import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musur/musur.dart';

final welcomeManagerProvider = Provider(
  (ref) => WelcomeManager(
    ref.watch(prefsProvider),
    ref.watch(welcomeStateProvider.notifier),
  ),
);
final welcomeStateProvider = StateNotifierProvider<WelcomeStateHolder, bool>(
  (ref) => WelcomeStateHolder(
    ref.watch(prefsProvider).value.getBool(_key) ?? false,
  ),
);

const _key = 'seen_welcome';

class WelcomeManager {
  final Prefs _prefs;
  final WelcomeStateHolder _state;

  const WelcomeManager(
    this._prefs,
    this._state,
  );

  Future<void> markSeen() async {
    await _prefs.value.setBool(_key, true);
    _state.setSeen(true);
  }
}

class WelcomeStateHolder extends StateNotifier<bool> {
  WelcomeStateHolder(bool value) : super(value);

  void setSeen(bool value) {
    state = value;
  }
}
