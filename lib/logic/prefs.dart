import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefsProvider = Provider((ref) => Prefs());

class Prefs {
  SharedPreferences? _prefs;
  SharedPreferences get prefs => _prefs!;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const spotifyCredentials = 'spotifyCredentials';
}
