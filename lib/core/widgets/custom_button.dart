import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.width,
    this.height,
    this.textColor,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
    this.fontsize,
  });

  final Color? color;
  final double? fontsize;
  final double? width;
  final double? height;
  final Color? textColor;
  final String text;
  final Function()? onPressed;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    final Color buttonColor =
        isOutline ? Appcolors.whiteColor : (color ?? Appcolors.primaryColor);

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: isOutline
              ? BorderSide(color: Appcolors.blackColor)
              : BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.getbodymTextStyle(
            color: textColor ?? Appcolors.backGroundColor,
            context,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
