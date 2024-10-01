import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/feature/home/presentation/widgets/home_banner.dart';
import 'package:bokiaa/feature/home/presentation/widgets/bestseller_widget.dart';
import 'package:bokiaa/feature/search/presentation/page/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedBanner = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset(
                AssetsIcon.logoSvg,
                height: 30,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AssetsIcon.notificationSvg),
              ),
              IconButton(
                onPressed: () {
                  push(context, const SearchView());
                },
                icon: SvgPicture.asset(AssetsIcon.searchSvg),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeBannerWidget(),
                const Gap(10),
                Text(
                  "Best Seller",
                  style: AppTextStyle.getTtileTextStyle(context),
                ),
                const Gap(10),
                const BestSellerBooksWidget()
              ],
            ),
          ),
        ));
  }
}
