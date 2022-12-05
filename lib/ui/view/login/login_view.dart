import 'package:firebase_authentication_app/ui/components/custom_button.dart';
import 'package:firebase_authentication_app/ui/components/custom_textfield_container.dart';
import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:firebase_authentication_app/ui/view/login/login_viewmodel.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = context.watch<LoginViewModel>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                SizedBox(
                  width: size.width / 1.1,
                  child: const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                SizedBox(
                  width: size.width / 1.1,
                  child: Text(
                    "Sign In to Continue!",
                    style: TextStyle(
                      letterSpacing: 1.7,
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                CustomTextField(
                  width: size.width * 0.9,
                  icon: Icons.email,
                  labelText: 'Email',
                  onChanged: (String value) {
                    viewModel.setEmail(email: value);
                  },
                ),
                CustomTextField(
                  width: size.width * 0.9,
                  icon: Icons.lock,
                  labelText: 'Password',
                  onChanged: (String value) {
                    viewModel.setPassword(password: value);
                  },
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                // viewModel.isLoading
                viewModel.loading
                    ? Center(
                        child: SizedBox(
                          height: size.height / 20,
                          width: size.height / 20,
                          child: const CircularProgressIndicator(),
                        ),
                      )
                    : FractionallySizedBox(
                        widthFactor: 0.95,
                        child: CustomButton(
                            color: kSecondaryColor,
                            label: 'Login',
                            onPressed: () async {
                              // await viewModel.loginUser(context);
                              FirebaseCrashlytics.instance.crash();
                            }),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
