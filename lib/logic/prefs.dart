import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefsProvider = Provider((ref) => Prefs());

class Prefs {
  SharedPreferences? _value;
  SharedPreferences get value => _value!;

  Future<void> init() async {
    _value = await SharedPreferences.getInstance();
  }

  static const spotifyCredentials = 'spotifyCredentials';
}
