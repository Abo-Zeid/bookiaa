import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorites Books ",
            style: AppTextStyle.getTtileTextStyle(context, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                  Expanded(
                    child: Column(
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
                                    border:
                                        Border.all(color: Appcolors.blackColor),
                                    borderRadius: BorderRadius.circular(12)),
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
                        const Gap(5),
                        Center(
                          child: CustomButton(
                            text: "Add To Cart",
                            onPressed: () {},
                            color: Appcolors.primaryColor,
                            height: 40,
                            width: 182,
                          ),
                        )
                      ],
                    ),
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
        ));
  }
}
