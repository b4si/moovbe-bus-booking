import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  Future saveApikey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiKey', apiKey);
    log(apiKey.toString());
  }

  Future saveAccessKey(String access) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access', access);
    log(access.toString());
  }
}
