import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: Card(
        color: Appcolors.acsentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(10),
            Text(
              text,
              style: AppTextStyle.getbodymTextStyle(context,
                  fontSize: 18, color: Appcolors.darkgreyColor),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Appcolors.darkgreyColor,
                ))
          ],
        ),
      ),
    );
  }
}
