// ignore_for_file: file_names

import 'package:bokiaa/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(child: Divider()),
      const Gap(10),
      Text(
        text,
        style: AppTextStyle.getbodymTextStyle(context),
      ),
      const Gap(10),
      const Expanded(child: Divider()),
    ]);
  }
}
