import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData? icon;
  final Widget? suffixIcon;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final double width;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.icon,
    this.suffixIcon,
    required this.onChanged,
    this.onTap,
    this.focusNode,
    this.controller,
    this.isReadOnly,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: width,
      decoration: BoxDecoration(
        color: kSecondaryColor20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onTap: onTap,
        readOnly: isReadOnly ?? false,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  color: kSecondaryColor,
                )
              : null,
          suffixIcon: suffixIcon,
          suffixIconColor: kSecondaryColor,
          border: InputBorder.none,
          labelText: labelText,
        ),
      ),
    );
  }
}
