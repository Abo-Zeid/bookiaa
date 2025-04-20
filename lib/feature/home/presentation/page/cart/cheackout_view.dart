import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/presentation/page/cart/cheackout_sucsses.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheackoutView extends StatelessWidget {
  final double totalPrice;

  const CheackoutView({super.key, required this.totalPrice});

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Appcolors.borderColor),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
              ),
            ),
            const Spacer(),
            Text(
              "Checkout",
              style: AppTextStyle.getTtileTextStyle(context),
            ),
            const Spacer(),
            const SizedBox(width: 41),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  _buildField("Full Name"),
                  const Gap(10),
                  _buildField("Email"),
                  const Gap(10),
                  _buildField("Address"),
                  const Gap(10),
                  _buildField("Phone"),
                  const Gap(10),
                  _buildField("Note", maxLines: 4),
                ],
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Text(
                  "Total : ",
                  style: AppTextStyle.getTtileTextStyle(
                    context,
                    color: Appcolors.greyColor,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.attach_money_sharp),
                    Text(
                      totalPrice.toStringAsFixed(2),
                      style: AppTextStyle.getTtileTextStyle(context),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(25),
            CustomButton(
              text: "Checkout",
              onPressed: () {
                push(context, const CheackoutSucsses());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String hint, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Appcolors.acsentColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
