import 'dart:developer';

import 'package:bokiaa/core/functions/dialogs.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/data/models/response/wish_list_response_model/wish_list_response_model.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_event.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

WishListResponseModel? wishListResponseModel;

class _WishListViewState extends State<WishListView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetWishListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "WishList",
            style: AppTextStyle.getTtileTextStyle(context, fontSize: 24),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is RemoveFromWishListloadedState) {
                Navigator.pop(context);
                context.read<HomeBloc>().add(GetWishListEvent());
              } else if (state is RemoveFormWishListloadingState ||
                  state is ShowWishListloadingState) {
                showLoadingDialog(context);
              } else if (state is ShowWishListloadedState) {
                Navigator.pop(context);
              }
            },
            buildWhen: (previous, current) =>
                current is ShowWishListloadedState,
            builder: (context, state) {
              var wishListBooks =
                  context.read<HomeBloc>().wishListResponseModel?.data?.data;
              if (wishListBooks?.isEmpty ?? false) {
                return const Center(child: Text("WishList IS Empty"));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                    itemCount: wishListBooks?.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 40,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: CachedNetworkImage(
                              imageUrl: wishListBooks?[index].image ?? "",
                              width: 100,
                              height: 118,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const Gap(15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        wishListBooks?[index].name ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.getbodymTextStyle(
                                            context,
                                            color: Appcolors.darkgreyColor),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton.outlined(
                                      constraints: const BoxConstraints(
                                          maxHeight: 24, maxWidth: 24),
                                      style: IconButton.styleFrom(),
                                      padding: const EdgeInsets.all(3),
                                      onPressed: () {
                                        context.read<HomeBloc>().add(
                                            RemoveFormWishListEvent(
                                                productId:
                                                    wishListBooks?[index].id ??
                                                        0));
                                      },
                                      icon: Icon(
                                        color: Appcolors.darkgreyColor,
                                        size: 16,
                                        Icons.close,
                                      ),
                                    )
                                  ],
                                ),
                                const Gap(10),
                                Text(
                                  "  \$${wishListBooks?[index].price ?? ""}",
                                  style: AppTextStyle.getbodymTextStyle(context,
                                      color: Appcolors.blackColor),
                                ),
                                const Gap(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      text: "Add To Cart",
                                      onPressed: () {
                                        log(state.toString());
                                        context.read<HomeBloc>().add(
                                            AddToCartEvent(
                                                productId:
                                                    wishListBooks?[index].id ??
                                                        0));
                                      },
                                      color: Appcolors.primaryColor,
                                      height: 40,
                                      width: 182,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }));
  }
}
