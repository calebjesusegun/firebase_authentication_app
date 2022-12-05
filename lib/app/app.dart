import 'package:firebase_authentication_app/services/auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
// Register dependencies
  locator.registerLazySingleton(
    () => FirebaseService(),
  );
}
