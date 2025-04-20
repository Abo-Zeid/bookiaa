import 'package:bokiaa/core/functions/dialogs.dart';
import 'package:bokiaa/core/widgets/back_card_widget.dart';
import 'package:bokiaa/feature/home/presentation/page/nav_bar_widget.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/login_params.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bokiaa/feature/auth/presentation/pages/forgetpassoword.dart';
import 'package:bokiaa/feature/auth/presentation/pages/register_view.dart';
import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/SocialButtonCard.dart';
import 'package:bokiaa/core/widgets/orDividerwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisable = true;

  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccesState) {
            Navigator.pop(context);
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is LoginErrorState) {
            Navigator.pop(context);

            showeErrorDialog(context);
          } else if (state is LoginLoadingState) {
            showLoadingDialog(context);
          }
        },
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
                "Don’t have an account?",
                style: AppTextStyle.getbodymTextStyle(
                  context,
                ),
              ),
              TextButton(
                  onPressed: () {
                    pushReplacement(context, const RegisterView());
                  },
                  child: Text(
                    "Register Now",
                    style: AppTextStyle.getbodymTextStyle(context,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.primaryColor),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Text(
                    "Welcome back!\nGlad to see you, Again!",
                    style: AppTextStyle.getTtileTextStyle(context,
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Email ";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Password ";
                      } else if (value.length < 6) {
                        return "Please make sure passwoerd at least 6 character";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Your password",
                        suffixIconConstraints:
                            const BoxConstraints(maxWidth: 33),
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
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            push(context, const Forgetpassoword());
                          },
                          child: Text(
                            "Forget PassWord ?",
                            style: AppTextStyle.getbodymTextStyle(context,
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LoginEvent(LoginParames(
                                email: emailController.text,
                                password: passwordController.text,
                              )));
                        }
                      },
                      color: Appcolors.primaryColor,
                      textColor: Appcolors.backGroundColor,
                      text: "Login",
                    ),
                  ),
                  const Gap(20),
                  const OrDividerWidget(
                    text: "Or Login With",
                  ),
                  const Gap(40),
                  const SocialButtonCard(),
                ],
              ),
            ),
          ),
        ));
  }
}
