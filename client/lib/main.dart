import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/my_app_screen/my_app_screen.dart';
import 'shared/utils/shared_preference.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  sp.prefs = await SharedPreferences.getInstance();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('vi')],
        startLocale: const Locale('vi'),
        fallbackLocale: const Locale('vi'),
        path: "assets/translations",
        child: const MyApp()),
  ));
}
