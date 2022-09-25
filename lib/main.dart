import 'dart:async';

import 'package:firebase_authentication_app/app/app.locator.dart';
import 'package:firebase_authentication_app/app/app.router.dart';
import 'package:firebase_authentication_app/ui/components/snackbar_setup.dart';
import 'package:firebase_authentication_app/ui/view/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future main() async {
  setupLocator();

  await setupSnackBarUI();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // runApp(const MyApp());

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(const MyApp());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
