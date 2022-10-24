import 'package:flutter/material.dart';

import 'screen/search_screen.dart';

class HomeRouter {
  HomeRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SearchScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
