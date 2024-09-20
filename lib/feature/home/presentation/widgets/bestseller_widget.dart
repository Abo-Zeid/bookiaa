import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:bokiaa/feature/home/presentation/page/book_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class BestSellerBooksWidget extends StatelessWidget {
  const BestSellerBooksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is BestSellerLoadedState ||
            current is HomeBannerLoadedState,
        builder: (context, state) {
          if (state is BestSellerLoadedState) {
            var books = context.read<HomeBloc>().bestSellerResponseModel?.data;
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: books?.products?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 163 / 281,
                    mainAxisExtent: 300),

                // ignore: avoid_types_as_parameter_names
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      push(
                          context,
                          BookDetailView(
                            product: books?.products?[index],
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolors.secondaryColor,
                      ),
                      width: 163,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: books?.products?[index].id ?? "",
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        books?.products?[index].image ?? '',
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(5),
                            Text(
                              books?.products?[index].name ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.getTtileTextStyle(context,
                                  fontSize: 16),
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ${books?.products?[index].price}",
                                  style: AppTextStyle.getTtileTextStyle(context,
                                      fontSize: 16),
                                ),
                                CustomButton(
                                  text: "Buy",
                                  onPressed: () {},
                                  color: Appcolors.blackColor,
                                  width: 72,
                                  height: 27,
                                  fontsize: 14,
                                  textColor: Appcolors.whiteColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
                child: Lottie.asset("assets/images/loading.json",
                    width: 100, height: 100));
          }
        });
  }
}
