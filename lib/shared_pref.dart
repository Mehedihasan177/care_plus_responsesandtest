
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('Shared Pref read:');
    return prefs.getString(key);
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('Shared Pref read:');
    return json.decode(prefs.getString(key).toString());
      //json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
    print('Shared Pref save:');
    print(value);
  }

  saveString(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    print('Shared Pref save string:');
    prefs.setString(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('Shared Pref remove:');
    prefs.remove(key);
  }
}
