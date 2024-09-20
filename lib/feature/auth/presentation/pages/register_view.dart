import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/dialogs.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/widgets/back_card_widget.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/nav_bar_widget.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/register_params.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bokiaa/feature/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordVisable = true;
  bool isPasswordConfirmationVisible = true;
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccesState) {
          pushReplacement(context, const NavBarWidget());
        } else if (state is RegisterErrorState) {
          showeErrorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Row(
                  children: [BackCardWidget()],
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
                      "Hello! Register to get \nstarted",
                      style: AppTextStyle.getTtileTextStyle(context,
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your name ";
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "UserName",
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your Email ";
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your Password ";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: isPasswordVisable,
                      decoration: InputDecoration(
                          hintText: "password",
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
                    const Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Confirm Your Password ";
                        }
                        return null;
                      },
                      controller: passwordConfirmationController,
                      obscureText: isPasswordConfirmationVisible,
                      decoration: InputDecoration(
                          hintText: "Confirm password",
                          suffixIconConstraints:
                              const BoxConstraints(maxWidth: 33),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordConfirmationVisible =
                                        !isPasswordConfirmationVisible;
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
                      child: state is RegisterLoadingState
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(RegisterEvent(
                                      RegisterParams(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          passwordConfirmation:
                                              passwordConfirmationController
                                                  .text)));
                                }
                              },
                              color: Appcolors.primaryColor,
                              textColor: Appcolors.backGroundColor,
                              text: "Register",
                            ),
                    ),
                    const Gap(15),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
