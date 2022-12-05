import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_authentication_app/ui/constants/app_color.dart';
import 'package:flutter/cupertino.dart';

void showFlush(
    {required String message,
    bool isSuccess = true,
    required BuildContext context}) async {
  await Flushbar(
    backgroundColor: isSuccess ? kSuccess : kFail,
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(seconds: 5),
    flushbarStyle: FlushbarStyle.FLOATING,
  ).show(context);
}
