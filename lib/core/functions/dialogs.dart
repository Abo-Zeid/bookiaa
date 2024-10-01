import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showeErrorDialog(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Appcolors.redColor,
    content: const Text("Error"),
  ));
}

showeSuccesDialog(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Appcolors.primaryColor,
    content: const Text("Succes"),
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
