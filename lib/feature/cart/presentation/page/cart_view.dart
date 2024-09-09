import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/auth/presentation/cheackout_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: AppTextStyle.getTtileTextStyle(context, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            "assets/images/bookWishlist.jpeg",
                            width: 100,
                            height: 118,
                          ),
                        ),
                        const Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "The Republic",
                                  style: AppTextStyle.getbodymTextStyle(context,
                                      color: Appcolors.greyColor),
                                ),
                                const Gap(130),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Appcolors.blackColor),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      size: 20,
                                      Icons.close,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Text(
                              "₹285",
                              style: AppTextStyle.getbodymTextStyle(context,
                                  color: Appcolors.blackColor),
                            ),
                            const Gap(20),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Appcolors.acsentColor),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 15,
                                      )),
                                ),
                                const Gap(10),
                                Text(
                                  counter.toString(),
                                  style: AppTextStyle.getTtileTextStyle(context,
                                      fontSize: 18),
                                ),
                                const Gap(10),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Appcolors.acsentColor),
                                  child: IconButton(
                                      onPressed: () {
                                        if (counter > 0) {
                                          setState(() {
                                            counter--;
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 40,
                    );
                  },
                ),
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
                onPressed: () {push(context, const CheackoutView());},
              )
            ],
          ),
        ));
  }
}
