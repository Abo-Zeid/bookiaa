import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularBookWidget extends StatelessWidget {
  const PopularBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Appcolors.secondaryColor,
      ),
      width: 163,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/theRepuplic.jpeg",
                fit: BoxFit.cover,
                width: 163,
              ),
            ),
            const Gap(5),
            Text(
              "The Republic",
              style: AppTextStyle.getTtileTextStyle(context, fontSize: 18),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹ 285",
                  style: AppTextStyle.getTtileTextStyle(context, fontSize: 16),
                ),
                CustomButton(
                  text: "Buy",
                  onPressed: () {},
                  color: Appcolors.blackColor,
                  width: 72,
                  height: 28,
                  fontsize: 14,
                  textColor: Appcolors.whiteColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
