import 'package:firebase_authentication_app/services/auth_service.dart';
import 'package:firebase_authentication_app/ui/view/home/home_view.dart';
import 'package:firebase_authentication_app/ui/view/login/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: FirebaseService),
    LazySingleton(classType: SnackbarService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
