import 'package:blood_bank/core/services/local_notfiication_service.dart';
import 'package:blood_bank/core/services/push_notification_service.dart';
import 'package:blood_bank/core/theme_cubit/theme_cubit.dart';
import 'package:blood_bank/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'blood_bank.dart';
import 'core/cache/prefs.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.wait([
    PushNotificationService.initialize(),
    LocalNotificationService.init(),
    EasyLocalization.ensureInitialized(),
    Prefs.init(),
  ]);
  tz.initializeTimeZones();
  setupGetit();
  changeSystemUiOverlayStyle();

  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child: BlocProvider(
        create: (context) => ThemeCubit()..getCurrentTheme(),
        child: const BloodBank(),
      ),
    ),
  );
}

changeSystemUiOverlayStyle() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
 // this is development branch for blood bank application