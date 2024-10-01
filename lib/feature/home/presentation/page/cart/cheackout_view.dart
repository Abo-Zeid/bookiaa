import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/presentation/page/cart/cheackout_sucsses.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheackoutView extends StatelessWidget {
  const CheackoutView({super.key});

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
              ),
              const Spacer(),
              Text(
                "Checkout",
                style: AppTextStyle.getTtileTextStyle(context),
              ),
              const Spacer(),
              const Gap(41)
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      filled: true,
                      fillColor: Appcolors.acsentColor,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Appcolors.acsentColor,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Address",
                      filled: true,
                      fillColor: Appcolors.acsentColor,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Phone",
                      filled: true,
                      fillColor: Appcolors.acsentColor,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Note",
                      filled: true,
                      fillColor: Appcolors.acsentColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      "Total : ",
                      style: AppTextStyle.getTtileTextStyle(context,
                          color: Appcolors.greyColor),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.attach_money_sharp),
                        Text(
                          "95.00",
                          style: AppTextStyle.getTtileTextStyle(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
              CustomButton(
                text: "Checkout",
                onPressed: () {
                  push(context, const CheackoutSucsses());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
