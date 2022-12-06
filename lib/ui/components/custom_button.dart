import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final double width;
  const CustomButton(
      {Key? key,
      required this.label,
      this.onPressed,
      this.color,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: width,
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 8.0,
            height: 56.0,
            textColor: Colors.white,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                letterSpacing: 1.5,
                color: kWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
