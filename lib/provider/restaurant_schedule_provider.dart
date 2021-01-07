import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_fundamtental_submission/data/preferences/restaurant_preference_helper.dart';
import 'package:dicoding_fundamtental_submission/utils/background_services.dart';
import 'package:dicoding_fundamtental_submission/utils/date_time_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RestaurantScheduleProvider extends ChangeNotifier {
  RestaurantPreferenceHelper restaurantPreferenceHelper;
  RestaurantScheduleProvider({@required this.restaurantPreferenceHelper}) {
    _getStatusNotification();
  }
  bool _isSchedule = false;
  bool get isSchedule => _isSchedule;

  void _getStatusNotification() async {
    _isSchedule = await restaurantPreferenceHelper.isSwitch;
    notifyListeners();
  }

  Future<bool> scheduleRestaurant(bool value) async {
    _isSchedule = value;
    restaurantPreferenceHelper.setNotificationStatus(value);
    _getStatusNotification();
    if (_isSchedule) {
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
