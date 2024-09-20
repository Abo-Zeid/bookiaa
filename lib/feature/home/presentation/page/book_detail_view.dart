import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/back_card_widget.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/data/models/response/best_seller_response_model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const BackCardWidget(),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AssetsIcon.bookMarkSvg),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 16, bottom: 20, top: 10, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product?.price ?? ""}",
              style: AppTextStyle.getHeadlineTextStyle(context),
            ),
            const Gap(50),
            Expanded(
              child: CustomButton(
                text: "Buy",
                onPressed: () {},
                color: Appcolors.textColor,
                height: 45,
                fontsize: 14,
                textColor: Appcolors.whiteColor,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(30),
                Hero(
                  tag: product?.id ?? "",
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: product?.image ?? "",
                      width: 180,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  product?.name ?? "",
                  style:
                      AppTextStyle.getHeadlineTextStyle(context, fontSize: 30),
                ),
                const Gap(16),
                Text(
                  product?.category ?? "",
                  style: AppTextStyle.getSmallTextStyle(context,
                      color: Appcolors.primaryColor),
                ),
                const Gap(16),
                Text(
                  textAlign: TextAlign.justify,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: AppTextStyle.getSmallTextStyle(
                    fontSize: 14,
                    context,
                  ),
                ),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
