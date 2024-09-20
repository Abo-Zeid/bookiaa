import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showeErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Appcolors.redColor,
    content: Text(text),
  ));
}

showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Lottie.asset('assets/images/loading.json',
            width: 20, height: 20);
      });
}
