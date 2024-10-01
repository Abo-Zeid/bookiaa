class HomeEvent {}

//BestSeller

class GetBestSellerEvent extends HomeEvent {}

//HomeBanner

class GetHomeBannerEvent extends HomeEvent {}

//WishList

class AddToWishListEvent extends HomeEvent {
  final int productId;

  AddToWishListEvent({required this.productId});
}

class RemoveFormWishListEvent extends HomeEvent {
  final int productId;

  RemoveFormWishListEvent({required this.productId});
}

class GetWishListEvent extends HomeEvent {}

//Cart

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFormCartEvent extends HomeEvent {
  final int cartId;

  RemoveFormCartEvent({required this.cartId});
}

class UpdateCartItemEvent extends HomeEvent {
  final int itemId;
  final int newQuantity;

  UpdateCartItemEvent({required this.newQuantity, required this.itemId});
}

class GetCartEvent extends HomeEvent {}
