import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantPreferenceHelper {
  final Future<SharedPreferences> sharedPreference;
  RestaurantPreferenceHelper({@required this.sharedPreference});
  static const NOTIF = 'NOTIFICATION';
  Future<bool> get isSwitch async {
    final prefs = await sharedPreference;
    return prefs.getBool(NOTIF) ?? false;
  }

  void setNotificationStatus(bool value) async {
    final prefs = await sharedPreference;
    prefs.setBool(NOTIF, value);
  }
}
