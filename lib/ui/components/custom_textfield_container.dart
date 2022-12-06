import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final double? width;
  final bool? isReadOnly;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.icon,
    this.suffixIcon,
    required this.onChanged,
    this.onTap,
    required this.obscureText,
    this.focusNode,
    this.controller,
    this.width,
    this.isReadOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onTap: onTap,
        obscureText: obscureText,
        readOnly: isReadOnly ?? false,
        controller: controller,
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: kGray0),
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: kSecondaryColor,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kGray10, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: kGray0),
          floatingLabelStyle: const TextStyle(color: kPrimaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
