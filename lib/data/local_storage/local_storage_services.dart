import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wac_test/data/models/profile_model.dart';

class LocalStorageServices {
  static final LocalStorageServices _instance = LocalStorageServices._internal();

  LocalStorageServices._internal();

  factory LocalStorageServices() {
    return _instance;
  }

  saveProfiles(List<Profile> profiles) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString("profiles", jsonEncode(profiles));
  }

  Future<String> getProfiles() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("profiles") ?? "";
  }
}