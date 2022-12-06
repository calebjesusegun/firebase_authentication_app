import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/success.json',
                width: 160,
                height: 160,
                alignment: Alignment.center,
              ),
              const Text(
                'Success!',
                style: TextStyle(
                    fontSize: 20, color: kGray0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height / 90,
              ),
              Text(
                'You have successfully logged in with $userEmail',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: kGray10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
