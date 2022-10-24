import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/home/view/screen/home_screen.dart';

import '../app_router.dart';
import 'constants/app_theme.dart';
import 'data/request/base_request.dart';
import 'flavors.dart';
import 'services/alert.dart';
import 'services/app_logger.dart';
import 'services/remote_config.dart';
import 'view/screens/splash.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key, this.home}) : super(key: key);
  final Widget? home;
  @override
  Widget build(BuildContext context) {
    return App(home: home);
  }
}

class App extends StatefulWidget {
  const App({Key? key, this.home}) : super(key: key);

  final Widget? home;

  @override
  _AppState createState() => _AppState();

  static Future<void> rebirth(BuildContext context) async {
    context.findAncestorStateOfType<_AppState>()?.restart();
  }
}

class _AppState extends State<App> {
  Key _key = UniqueKey();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, widget) => MaterialApp(
            key: _key,
            builder: builder,
            title: AppFlavor.title,
            onGenerateRoute: AppRouter.onGenerateRoute,
            navigatorKey: AppLogger.instance.navigatorKey,
            home: widget,
          ),
          child: _Home(home: widget.home),
        );
  }

  Widget builder(BuildContext context, Widget? widget) {
    if (widget == null) return Container();
    // ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    //   return CustomError(errorDetails: errorDetails);
    // };
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: widget,
    );
  }

  void restart() {
    setState(() {
      Alert.newInstance();
      AppLogger.newInstance();
      _key = UniqueKey();
    });
  }
}

class _Home extends StatefulWidget {
  const _Home({Key? key, this.home}) : super(key: key);

  final Widget? home;

  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  final deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    BaseRequestDefaults.instance.setBaseUrl(AppFlavor.baseUrl);
    BaseRequestDefaults.instance.addHeader('User-Agent', 'Mobile');
    FirebaseRemoteConfig.instance.setupRemoteConfig(context);

    if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((value) {
        if (value.androidId != null) {
          BaseRequestDefaults.instance.addHeader('uuid', value.androidId!);
        }
      });
    } else if (Platform.isIOS) {
      deviceInfo.iosInfo.then((value) {
        if (value.identifierForVendor != null) {
          BaseRequestDefaults.instance
              .addHeader('uuid', value.identifierForVendor!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
