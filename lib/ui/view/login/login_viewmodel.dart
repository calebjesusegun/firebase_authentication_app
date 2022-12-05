import 'package:firebase_authentication_app/app/app.dart';
import 'package:firebase_authentication_app/services/auth_service.dart';
import 'package:firebase_authentication_app/ui/components/snackbar_setup.dart';
import 'package:firebase_authentication_app/ui/view/home/home_view.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final _firebaseService = locator<FirebaseService>();

  String _email = '';
  String _password = '';

  //A setter for _Email
  void setEmail({required String email}) {
    _email = email.trim();
    notifyListeners();
  }

  //A setter for _Password
  void setPassword({required String password}) {
    _password = password.trim();
    notifyListeners();
  }

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> loginUser(BuildContext context) async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      setLoading(true);
      await _firebaseService.logIn(_email, _password).then((user) {
        setLoading(false);
        if (user != null) {
          showFlush(
              message: 'You are successfully logged in ',
              isSuccess: true,
              context: context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomeView(userEmail: _email),
            ),
          );
        } else {
          showFlush(
              message:
                  'kindly confirm that you entered the right login credentials',
              isSuccess: false,
              context: context);
        }
      });
    } else {
      setLoading(false);
      showFlush(
          message: 'Kindly fill in the form field correctly',
          isSuccess: false,
          context: context);
    }
  }
}
