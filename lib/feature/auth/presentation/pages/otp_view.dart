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
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    //
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      key: formKey,
      child: Scaffold(
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
                      fontWeight: FontWeight.bold,
                      color: Appcolors.primaryColor),
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
                Center(
                  child: Directionality(
                    // Specify direction if desired
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      // You can pass your own SmsRetriever implementation based on any package
                      // in this example we are using the SmartAuth
                      controller: pinController,
                      focusNode: focusNode,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      validator: (value) {
                        return value == '2222' ? null : 'Pin is incorrect';
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      focusNode.unfocus();
                      if (formKey.currentState!.validate()) {
                        push(context, const CreatePassword());
                      }
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
      ),
    );
  }
}
