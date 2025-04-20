import 'package:bokiaa/core/functions/dialogs.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
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

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
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
          if (state is RemoveFormCartloadingState ||
              state is ShowCartloadingState) {
            showLoadingDialog(context);
          } else if (state is RemoveFromCartloadedState ||
              state is UpdateCartLoadedState) {
            Navigator.pop(context); // Dismiss loading
            context.read<HomeBloc>().add(GetCartEvent()); // Refresh
          } else if (state is ShowCartloadedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cartList =
              context.read<HomeBloc>().cartResponseModel?.data?.cartItems;

          if (cartList == null || cartList.isEmpty) {
            return const Center(child: Text("Cart is Empty"));
          }

          double totalPrice = cartList.fold(0.0, (sum, item) {
            double price = double.tryParse(item.itemProductPrice ?? '0') ?? 0;
            return sum + (price * (item.itemQuantity ?? 0));
          });

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartList.length,
                    separatorBuilder: (_, __) => const Divider(height: 40),
                    itemBuilder: (context, index) {
                      final item = cartList[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: CachedNetworkImage(
                              imageUrl: item.itemProductImage ?? "",
                              width: 100,
                              height: 118,
                              fit: BoxFit.cover,
                              errorWidget: (_, __, ___) =>
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
                                        item.itemProductName ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.getbodymTextStyle(
                                          context,
                                          color: Appcolors.darkgreyColor,
                                        ),
                                      ),
                                    ),
                                    IconButton.outlined(
                                      constraints: const BoxConstraints(
                                          maxHeight: 24, maxWidth: 24),
                                      padding: const EdgeInsets.all(3),
                                      onPressed: () {
                                        context.read<HomeBloc>().add(
                                              RemoveFormCartEvent(
                                                  cartId: item.itemId ?? 0),
                                            );
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Appcolors.darkgreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Text(
                                  "\$${item.itemProductPrice ?? ""}",
                                  style: AppTextStyle.getbodymTextStyle(
                                    context,
                                    color: Appcolors.blackColor,
                                  ),
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    _QuantityButton(
                                      icon: Icons.add,
                                      onTap: () {
                                        final newQty =
                                            (item.itemQuantity ?? 0) + 1;
                                        context
                                            .read<HomeBloc>()
                                            .add(UpdateCartItemEvent(
                                              itemId: item.itemId ?? 0,
                                              newQuantity: newQty,
                                            ));
                                      },
                                    ),
                                    const Gap(15),
                                    Text(
                                      "${item.itemQuantity ?? 0}",
                                      style: AppTextStyle.getTtileTextStyle(
                                          context,
                                          fontSize: 18),
                                    ),
                                    const Gap(15),
                                    _QuantityButton(
                                      icon: Icons.remove,
                                      onTap: () {
                                        final currentQty =
                                            item.itemQuantity ?? 0;
                                        if (currentQty > 1) {
                                          context
                                              .read<HomeBloc>()
                                              .add(UpdateCartItemEvent(
                                                itemId: item.itemId ?? 0,
                                                newQuantity: currentQty - 1,
                                              ));
                                        }
                                      },
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
                      style: AppTextStyle.getTtileTextStyle(
                        context,
                        color: Appcolors.greyColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: AppTextStyle.getTtileTextStyle(context),
                    ),
                  ],
                ),
                const Gap(15),
                CustomButton(
                  text: "Checkout",
                  onPressed: () => push(context, CheackoutView(totalPrice: totalPrice)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Appcolors.acsentColor,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 17, color: Appcolors.blackColor),
        onPressed: onTap,
      ),
    );
  }
}
