import 'dart:async';

import 'package:firebase_authentication_app/app/app.dart';
import 'package:firebase_authentication_app/ui/view/login/login_view.dart';
import 'package:firebase_authentication_app/ui/view/login/login_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future main() async {
  await setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runZonedGuarded<Future<void>>(
    () async {
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LoginViewModel(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
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
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const LoginView(),
    );
  }
}
