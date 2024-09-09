import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialButtonCard extends StatelessWidget {
  const SocialButtonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCardItem(
          logo: AssetsIcon.facebookSvg,
          onTap: () {},
        ),
        const Gap(8),
        SocialCardItem(
          logo: AssetsIcon.googleSvg,
          onTap: () {},
        ),
        const Gap(8),
        SocialCardItem(
          logo: AssetsIcon.appleSvg,
          onTap: () {},
        ),
      ],
    );
  }
}

class SocialCardItem extends StatelessWidget {
  const SocialCardItem({super.key, required this.logo, required this.onTap});
  final String logo;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Appcolors.borderColor)),
          child: SvgPicture.asset(logo),
        ),
      ),
    );
  }
}
