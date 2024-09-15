import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/auth/presentation/pages/login_view.dart';
import 'package:bokiaa/feature/auth/presentation/pages/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/book.png",
                    ))),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    SvgPicture.asset(AssetsIcon.logoSvg),
                    const Gap(15),
                    Text(
                      "Order Your Book Now!",
                      style: AppTextStyle.getTtileTextStyle(context),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    CustomButton(
                      onPressed: () => (push(context, const LoginView())),
                      color: Appcolors.primaryColor,
                      textColor: Appcolors.backGroundColor,
                      text: "Login",
                    ),
                    const Gap(15),
                    CustomButton(
                      onPressed: () => (push(context, const RegisterView())),
                      textColor: Appcolors.darkgreyColor,
                      isOutline: true,
                      text: "Register",
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ]),
            )));
  }
}
