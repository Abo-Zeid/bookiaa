import 'package:bokiaa/core/widgets/back_card_widget.dart';
import 'package:bokiaa/feature/auth/presentation/pages/login_view.dart';
import 'package:bokiaa/feature/auth/presentation/pages/otp_view.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Forgetpassoword extends StatefulWidget {
  const Forgetpassoword({super.key});

  @override
  State<Forgetpassoword> createState() => _ForgetpassowordState();
}

class _ForgetpassowordState extends State<Forgetpassoword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            children: [BackCardWidget()],
          )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Remember Password?",
            style: AppTextStyle.getbodymTextStyle(
              context,
            ),
          ),
          TextButton(
              onPressed: () {
                push(context, const LoginView());
              },
              child: Text(
                " Login",
                style: AppTextStyle.getbodymTextStyle(context,
                    fontWeight: FontWeight.bold, color: Appcolors.primaryColor),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Forgot Password?",
              style: AppTextStyle.getTtileTextStyle(context,
                  fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Gap(10),
            Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: AppTextStyle.getbodymTextStyle(context,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.greyColor)),
            const Gap(20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                filled: true,
                fillColor: Appcolors.acsentColor,
              ),
            ),
            const Gap(20),
            Center(
              child: CustomButton(
                onPressed: () {
                  push(context, const OtpView());
                },
                color: Appcolors.primaryColor,
                textColor: Appcolors.backGroundColor,
                text: "Send Code",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
