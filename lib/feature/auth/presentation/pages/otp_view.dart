import 'package:bokiaa/core/widgets/back_card_widget.dart';
import 'package:bokiaa/feature/auth/presentation/pages/createpassword.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
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
            "Didn't Recive a code ?",
            style: AppTextStyle.getbodymTextStyle(
              context,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Resend",
                style: AppTextStyle.getbodymTextStyle(context,
                    fontWeight: FontWeight.bold, color: Appcolors.primaryColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Text(
                "OTP Verification",
                style: AppTextStyle.getTtileTextStyle(context,
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                  "Enter the verification code we just sent on your email address.",
                  style: AppTextStyle.getbodymTextStyle(context,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.greyColor)),
              const Gap(20),
              const Center(child: Pinput()),
              const Gap(20),
              Center(
                child: CustomButton(
                  onPressed: () {
                    push(context, const CreatePassword());
                  },
                  color: Appcolors.primaryColor,
                  textColor: Appcolors.backGroundColor,
                  text: "Verify",
                ),
              ),
              const Gap(350),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't Recive a code ?",
                    style: AppTextStyle.getbodymTextStyle(
                      context,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend",
                        style: AppTextStyle.getbodymTextStyle(context,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primaryColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
