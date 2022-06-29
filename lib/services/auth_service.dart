import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/app/app.logger.dart';

class FirebaseService {
  final log = getLogger('FirebaseService');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> logIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      log.i("Login Sucessfull");

      return userCredential.user;
    } catch (e) {
      log.e(e);
      return null;
    }
  }
}
