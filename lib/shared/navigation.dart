import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatiorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, Object argument) {
    navigatiorKey.currentState.pushNamed(routeName, arguments: argument);
  }

  static back() => navigatiorKey.currentState.pop();
}
