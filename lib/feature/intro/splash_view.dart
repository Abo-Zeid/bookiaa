// ignore_for_file: use_build_context_synchronously

import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/services/local_storage.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/home/presentation/page/nav_bar_widget.dart';
import 'package:bokiaa/feature/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String token = AppLocalStorage.getData(key: AppLocalStorage.token) ?? '';
    Future.delayed(const Duration(seconds: 3), () {
      if (token.isNotEmpty) {
        pushReplacement(context, const NavBarWidget());
      } else {
        pushReplacement(context, const WelcomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsIcon.logoSvg),
            const Gap(20),
            Text(
              "Order Your Book Now!",
              style: AppTextStyle.getbodymTextStyle(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
