import 'package:firebase_authentication_app/ui/components/custom_button.dart';
import 'package:firebase_authentication_app/ui/components/custom_textfield_container.dart';
import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:firebase_authentication_app/ui/view/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Text(
                'Hello $userEmail',
                style: const TextStyle(fontSize: 17, color: kPrimaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
