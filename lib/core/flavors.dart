import 'dart:io';

bool testMode = Platform.environment.containsKey('FLUTTER_TEST');
bool testingEnvironment = AppFlavor.appFlavor == Flavors.testing;


enum Flavors {
  testing,

}

class AppFlavor {
  static late Flavors appFlavor = Flavors.testing;

  static String get title {
    switch (appFlavor) {
      case Flavors.testing:
        return 'Testing';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavors.testing:
        return 'https://api.themoviedb.org/3/';
    }
  }

}
