import 'package:flutter/material.dart';
import 'package:ldma/views/about_page.dart';
import 'package:ldma/views/order/order_view.dart';
import 'package:ldma/views/home_page.dart';
import 'package:ldma/views/not_found_page.dart';
import 'package:ldma/views/settings_page.dart';
import 'package:ldma/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
