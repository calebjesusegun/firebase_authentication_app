import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Text(
              'Hello, here is your logged in Email Address: $userEmail',
              style: const TextStyle(fontSize: 17, color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
