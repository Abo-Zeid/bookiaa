import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Succses extends StatelessWidget {
  const Succses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsIcon.doneSvg),
              const Gap(20),
              Text(
                "Password Changed!",
                style: AppTextStyle.getTtileTextStyle(
                  context,
                ),
              ),
              const Gap(5),
              Text(
                textAlign: TextAlign.center,
                "Your password has been changed.\nsuccessfully",
                style: AppTextStyle.getbodymTextStyle(context,
                    fontSize: 15, color: Appcolors.greyColor),
              ),
              const Gap(40),
              CustomButton(
                  text: "Back To Login",
                  onPressed: () {
                    pushReplacement(context, const LoginView());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
