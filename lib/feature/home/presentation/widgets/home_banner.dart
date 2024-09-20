import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({super.key});

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  int selectedBanner = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeBannerLoadedState ||
            current is BestSellerLoadedState,
        builder: (context, state) {
          if (state is HomeBannerLoadedState) {
            var banner = context.read<HomeBloc>().homeBannerResponseModel?.data;
            return Column(
              children: [
                CarouselSlider.builder(
                    itemCount: banner?.sliders?.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) =>
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: banner?.sliders?[index].image ?? "",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              )
                            ]),
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlay: true,
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
              ],
            );
          } else {
            return Center(
                child: Lottie.asset("assets/images/loading.json",
                    width: 100, height: 100));
          }
        });
  }
}
