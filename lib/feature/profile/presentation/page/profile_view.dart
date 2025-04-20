import 'dart:developer';

import 'package:bokiaa/core/functions/sign_out.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:bokiaa/feature/profile/presentation/bloc/profile_state.dart';
import 'package:bokiaa/feature/profile/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cardNames = [
      "My Orders",
      "Edit Profile",
      "Reset Password",
      "FAQ",
      "Contact Us",
      "Privacy & Terms",
    ];

    return BlocProvider(
      create: (BuildContext context) => ProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(),
              Text(
                "Profile",
                style: AppTextStyle.getHeadlineTextStyle(context, fontSize: 24),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    signOut(context);
                  },
                  icon: SvgPicture.asset("assets/icons/exit.svg"))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                  log("State$state");
                  if (state is ProfileLoadedState) {
                    var detail =
                        context.read<ProfileBloc>().profileResponseModel?.data;

                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/rockcms/2023-10/231015-Yahya-Sinwar-Hamas-mb-0731-95501d.jpg"),
                          radius: 50,
                        ),
                        const Gap(13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail?.name?.toUpperCase() ?? "",
                              style: AppTextStyle.getTtileTextStyle(context),
                            ),
                            Text(
                              detail?.email ?? "",
                              style: AppTextStyle.getSmallTextStyle(
                                context,
                                color: Appcolors.greyColor,
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(
                        child: Lottie.asset("assets/images/loading.json",
                            width: 100, height: 100));
                  }
                }),
                const Gap(20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cardNames.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CardWidget(text: cardNames[index]),
                          const Gap(10),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
