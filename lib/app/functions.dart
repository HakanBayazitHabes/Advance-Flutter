import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "Unknown";
  String version = "Unknown";
  String? identifier = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;

  try {
    // ignore: unnecessary_null_comparison
    if (androidInfo != null) {
      name = androidInfo.brand + " " + androidInfo.model;
      identifier = androidInfo.id;
      version = androidInfo.version.codename;
    } else if (iosInfo != null) {
      name = iosInfo.name + " " + iosInfo.model;
      identifier = iosInfo.identifierForVendor;
      version = iosInfo.systemVersion;
    }
  } on PlatformException {
    print('Failed to get platform version');
    return DeviceInfo(name, version, identifier!);
  }

  return DeviceInfo(name, version, identifier!);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
