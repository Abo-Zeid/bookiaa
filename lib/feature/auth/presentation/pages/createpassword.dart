import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/auth/presentation/pages/succses.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: 41,
                height: 41,
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Appcolors.borderColor)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  iconSize: 20,
                ),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Create new password",
              style: AppTextStyle.getTtileTextStyle(context,
                  fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Gap(10),
            Text(
                " Your new password must be unique from those\n previously used.",
                style: AppTextStyle.getbodymTextStyle(context,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.acsentColor)),
            const Gap(20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Create Password",
                filled: true,
                fillColor: Appcolors.acsentColor,
              ),
            ),
            const Gap(20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Confirm PassWord",
                filled: true,
                fillColor: Appcolors.acsentColor,
              ),
            ),
            const Gap(20),
            Center(
              child: CustomButton(
                onPressed: () {
                  pushReplacement(context, const Succses());
                },
                color: Appcolors.primaryColor,
                textColor: Appcolors.backGroundColor,
                text: "Reset Password",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
