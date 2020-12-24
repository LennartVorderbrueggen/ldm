import 'package:flutter/material.dart';
import 'package:ldma/views/order/order_view.dart';
import 'package:ldma/views/not_found_page.dart';
import 'package:ldma/views/settings_page.dart';
import 'package:ldma/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.orderRoute:
        return MaterialPageRoute(builder: (_) => OrderView());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
