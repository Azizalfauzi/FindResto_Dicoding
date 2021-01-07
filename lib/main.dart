import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_fundamtental_submission/shared/navigation.dart';
import 'package:dicoding_fundamtental_submission/ui/pages/pages.dart';
import 'package:dicoding_fundamtental_submission/utils/background_services.dart';
import 'package:dicoding_fundamtental_submission/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        ListPageRestaurant.routeName: (context) => ListPageRestaurant(),
        DetailPage.routeName: (context) =>
            DetailPage(id: ModalRoute.of(context).settings.arguments),
        SearchRestaurantPage.routeName: (context) => SearchRestaurantPage(),
        AddReviewPage.routeName: (context) =>
            AddReviewPage(id: ModalRoute.of(context).settings.arguments),
        FavoriteRestaurantPage.routeName: (context) => FavoriteRestaurantPage(),
        SettingsRestaurantPage.routeName: (context) => SettingsRestaurantPage(),
      },
      navigatorKey: navigatiorKey,
    );
  }
}
