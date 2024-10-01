import 'package:bokiaa/core/functions/dialogs.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/data/models/response/cart_response_model/cart_response_model.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_event.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:bokiaa/feature/home/presentation/page/cart/cheackout_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

CartResponseModel? cartResponseModel;

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: AppTextStyle.getTtileTextStyle(context, fontSize: 24),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is ShowCartloadedState) {
                Navigator.pop(context);
              } else if (state is RemoveFormCartloadingState ||
                  state is ShowCartloadingState) {
                showLoadingDialog(context);
              } else if (state is RemoveFromCartloadedState) {
                Navigator.pop(context);
                context.read<HomeBloc>().add(GetCartEvent());
              }
            },
            buildWhen: (previous, current) => current is ShowCartloadedState,
            builder: (context, state) {
              var cartList =
                  context.read<HomeBloc>().cartResponseModel?.data?.cartItems;
              if (cartList?.isEmpty ?? false) {
                return const Center(child: Text("Cart is Empty"));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: cartList?.length ?? 0,
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
                                    imageUrl:
                                        cartList?[index].itemProductImage ?? "",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cartList?[index]
                                                      .itemProductName ??
                                                  "",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle
                                                  .getbodymTextStyle(context,
                                                      color: Appcolors
                                                          .darkgreyColor),
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
                                                  RemoveFormCartEvent(
                                                      cartId: cartList?[index]
                                                              .itemId ??
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
                                        " \$${cartList?[index].itemProductPrice ?? ""}",
                                        style: AppTextStyle.getbodymTextStyle(
                                            context,
                                            color: Appcolors.blackColor),
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Appcolors.acsentColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  int currentQuantity =
                                                      cartList?[index]
                                                              .itemQuantity ??
                                                          0;
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(UpdateCartItemEvent(
                                                        itemId: cartList?[index]
                                                                .itemId ??
                                                            0,
                                                        newQuantity:
                                                            currentQuantity + 1,
                                                      ));
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Appcolors.blackColor,
                                                  size: 17,
                                                )),
                                          ),
                                          const Gap(15),
                                          Text(
                                            "${cartList?[index].itemQuantity ?? 0}",
                                            style:
                                                AppTextStyle.getTtileTextStyle(
                                                    context,
                                                    fontSize: 18),
                                          ),
                                          const Gap(15),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Appcolors.acsentColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  int currentQuantity =
                                                      cartList?[index]
                                                              .itemQuantity ??
                                                          0;
                                                  if (currentQuantity > 1) {
                                                    context
                                                        .read<HomeBloc>()
                                                        .add(
                                                            UpdateCartItemEvent(
                                                          itemId:
                                                              cartList?[index]
                                                                      .itemId ??
                                                                  0,
                                                          newQuantity:
                                                              currentQuantity -
                                                                  1,
                                                        ));
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: Appcolors.blackColor,
                                                  size: 17,
                                                )),
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
                      ),
                      Row(
                        children: [
                          Text(
                            "Total : ",
                            style: AppTextStyle.getTtileTextStyle(context,
                                color: Appcolors.greyColor),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                "\$",
                                style: AppTextStyle.getTtileTextStyle(context),
                              )
                            ],
                          )
                        ],
                      ),
                      const Gap(15),
                      CustomButton(
                        text: "Checkout",
                        onPressed: () {
                          push(context, const CheackoutView());
                        },
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
