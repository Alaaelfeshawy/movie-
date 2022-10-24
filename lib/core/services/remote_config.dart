import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../flavors.dart';

class FirebaseRemoteConfig {
  FirebaseRemoteConfig._();

  static final _instance = FirebaseRemoteConfig._();
  static FirebaseRemoteConfig get instance => _instance;

  late PackageInfo _packageInfo;

  int mandatoryUpdate = 1;
  int latestAppVersion = 1;
  int buildNumber = 1;
  bool serviceNotAvailable = false;

  Future<void> setupRemoteConfig(BuildContext context) async {
    if (testMode) return;
    _packageInfo = await PackageInfo.fromPlatform();
    buildNumber = int.tryParse(_packageInfo.buildNumber) ?? 1;
    _setConfigSettings();
    Timer.periodic(const Duration(minutes: 11), (timer) {
      checkForUpdates(context);
    });
  }

  Future<void> _setConfigSettings() async {
  }

  void checkForUpdates(BuildContext context) {
    if (testMode) return;
  }
}
