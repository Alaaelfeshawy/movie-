import 'package:flutter/material.dart';

import 'screen/movie_details_screen.dart';

class MovieDetailsRouter {
  MovieDetailsRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MovieDetailsScreen.id:
        final argumentsMap = routeSettings.arguments! as Map<String, dynamic>;
        final movieId = argumentsMap["MOVIE_ID"] as int?;
        return MaterialPageRoute(
          builder: (_) =>  MovieDetailsScreen(
            movieId: movieId,
          ),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
