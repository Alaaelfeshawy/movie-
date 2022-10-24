import 'package:flutter/material.dart';
import 'package:movie/home/view/router.dart';
import 'package:movie/home/view/screen/home_screen.dart';
import 'package:movie/movie_details/view/router.dart';

import 'core/view/router.dart';
import 'core/view/screens/splash.dart';

class AppRouter {
  AppRouter._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return HomeRouter.onGenerateRoute(routeSettings) ??
        MovieDetailsRouter.onGenerateRoute(routeSettings) ??
        //?This should never happen
        MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
