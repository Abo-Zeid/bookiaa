import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/auth/presentation/login_view.dart';
import 'package:bokiaa/core/widgets/SocialButtonCard.dart';
import 'package:bokiaa/core/widgets/orDividerwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordVisable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " have an account?",
            style: AppTextStyle.getbodymTextStyle(
              context,
            ),
          ),
          TextButton(
              onPressed: () {
                pushReplacement(context, const LoginView());
              },
              child: Text(
                "Login Now",
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
                "Hello! Register to get \nstarted",
                style: AppTextStyle.getTtileTextStyle(context,
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "UserName",
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const Gap(15),
              TextFormField(
                obscureText: isPasswordVisable,
                decoration: InputDecoration(
                    hintText: "password",
                    suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordVisable = !isPasswordVisable;
                            });
                          },
                          child: SvgPicture.asset(
                            AssetsIcon.eyeSvg,
                          ),
                        ),
                      ],
                    )),
              ),
              const Gap(15),
              TextFormField(
                obscureText: isPasswordVisable,
                decoration: InputDecoration(
                    hintText: "Confirm password",
                    suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordVisable = !isPasswordVisable;
                            });
                          },
                          child: SvgPicture.asset(
                            AssetsIcon.eyeSvg,
                          ),
                        ),
                      ],
                    )),
              ),
              const Gap(15),
              Center(
                child: CustomButton(
                  onPressed: () {},
                  color: Appcolors.primaryColor,
                  textColor: Appcolors.backGroundColor,
                  text: "Register",
                ),
              ),
              const Gap(15),
              const OrDividerWidget(
                text: "Or Register With",
              ),
              const Gap(20),
              const SocialButtonCard(),
            ],
          ),
        ),
      ),
    );
  }
}
