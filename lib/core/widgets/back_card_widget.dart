import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  const BackCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
