import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';

showeErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Appcolors.redColor,
    content: Text(text),
  ));
}
