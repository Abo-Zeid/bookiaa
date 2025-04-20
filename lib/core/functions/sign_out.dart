import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/feature/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signOut(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
   // ignore: use_build_context_synchronously
  pushReplacement(context, const WelcomeView());
}
