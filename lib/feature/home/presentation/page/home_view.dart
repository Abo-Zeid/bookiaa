import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/presentation/widgets/popularbook_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                onPressed: () {},
                icon: SvgPicture.asset(AssetsIcon.searchSvg),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/banner.png",
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Find out the best books to read \nwhen you don’t even know what \nto read !!! ",
                                style: AppTextStyle.getSmallTextStyle(context),
                              ),
                              CustomButton(
                                width: 84,
                                height: 28,
                                onPressed: () {},
                                isOutline: true,
                                text: "Explore",
                                fontsize: 10,
                                textColor: Appcolors.primaryColor,
                              ),
                            ],
                          ),
                        )
                      ]),
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (value, reson) {
                      setState(() {
                        selectedBanner = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              const Gap(10),
              SmoothPageIndicator(
                count: 4,
                effect: ExpandingDotsEffect(
                    activeDotColor: Appcolors.primaryColor,
                    dotColor: Appcolors.borderColor,
                    dotHeight: 7,
                    dotWidth: 7,
                    expansionFactor: 7,
                    radius: 7),
                onDotClicked: (index) {},
                controller: PageController(initialPage: selectedBanner),
              ),
              const Gap(20),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 163 / 281,
                    ),
                    itemCount: 4,
                    // ignore: avoid_types_as_parameter_names
                    itemBuilder: (context, int) {
                      return const PopularBookWidget();
                    }),
              )
            ],
          ),
        ));
  }
}
