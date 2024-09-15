import 'package:bokiaa/core/utils/theme.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bokiaa/feature/intro/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashView()),
      );
}
