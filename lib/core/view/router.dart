import 'package:flutter/material.dart';

import 'screens/splash.dart';
import 'screens/walkthrough.dart';

class CoreRouter {
  CoreRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Splash.id:
      //   return MaterialPageRoute(
      //     builder: (_) => const Splash(),
      //     settings: routeSettings,
      //   );
      case WalkthroughScreen.id:
        return MaterialPageRoute(
          builder: (_) => const WalkthroughScreen(),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
