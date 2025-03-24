import 'package:blood_bank/core/services/local_notfiication_service.dart';
import 'package:blood_bank/core/services/push_notification_service.dart';
import 'package:blood_bank/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'blood_bank.dart';
import 'core/cache/prefs.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationService.initialize();
  await LocalNotificationService.init();
  tz.initializeTimeZones();
  await EasyLocalization.ensureInitialized();
  await Prefs.init();
  setupGetit();
  changeSystemUiOverlayStyle();

  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      saveLocale: true,
      child: const BloodBank(),
    ),
  );
}

changeSystemUiOverlayStyle() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
 // this is development branch for blood bank application