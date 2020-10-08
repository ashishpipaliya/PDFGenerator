import 'package:flutter/material.dart';
import 'package:pdf_gen/utils/logger.dart';

class NavigationService {
  static NavigationService _instance = NavigationService._internal();
  NavigationService._internal() {
    Logger().v("Navigation Service instance created");
  }

  factory NavigationService() {
    return _instance;
  }

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  BuildContext get context =>
      NavigationService().navigatorKey.currentState.overlay.context;

  Future<dynamic> navigateNamedTo(String routeName) {
    FocusScope.of(navigatorKey.currentContext).unfocus();
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateTo<T extends Object>(Route<T> route) {
    FocusScope.of(navigatorKey.currentContext).unfocus();
    return navigatorKey.currentState.push(route);
  }

  Future<dynamic> navigateReplaceTo<T extends Object>(Route<T> route) {
    FocusScope.of(navigatorKey.currentContext).unfocus();
    return navigatorKey.currentState.pushReplacement(
      route,
    );
  }

  Future<dynamic> navigateRemoveAndUntil<T extends Object>(
      Route<T> route, Route<T> route1) {
    FocusScope.of(navigatorKey.currentContext).unfocus();
    return navigatorKey.currentState.pushAndRemoveUntil(
        route, (Route<dynamic> routev) => (routev == route1));
  }

  Future<dynamic> navigateRemoveAndUntilNamed(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (_) => false);
  }

  void pop({int result}) {
    return navigatorKey.currentState.pop(result ?? 0);
  }
}
