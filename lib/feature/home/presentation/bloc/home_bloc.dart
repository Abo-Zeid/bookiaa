import 'package:bokiaa/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/cart_response_model/cart_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/wish_list_response_model/wish_list_response_model.dart';
import 'package:bokiaa/feature/home/data/repo/home_repo.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_event.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeIntial()) {
//BestSeller
    on<GetBestSellerEvent>(getBestSellerBooks);
//HomeBanner
    on<GetHomeBannerEvent>(getHomeBanner);
//WishList
    on<GetWishListEvent>(getWishList);
    on<AddToWishListEvent>(addToWishList);
    on<RemoveFormWishListEvent>(removeFromWishList);
//Cart
    on<GetCartEvent>(getCart);
    on<AddToCartEvent>(addToCart);
    on<RemoveFormCartEvent>(removeFromCart);
    on<UpdateCartItemEvent>;
  }
  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;
  WishListResponseModel? wishListResponseModel;
  CartResponseModel? cartResponseModel;

  //BestSeller
  Future<void> getBestSellerBooks(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerLoadingState());
    await HomeRepo.getBestSellerBooks().then((value) {
      if (value != null) {
        bestSellerResponseModel = value;
        emit(BestSellerLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

//HomeBanner
  Future<void> getHomeBanner(
      GetHomeBannerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBannerLoadingState());
    await HomeRepo.getHomeBanner().then((value) {
      if (value != null) {
        homeBannerResponseModel = value;
        emit(HomeBannerLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  //WishList
  Future<void> getWishList(
      GetWishListEvent event, Emitter<HomeState> emit) async {
    emit(ShowWishListloadingState());
    await HomeRepo.getWishList().then((value) {
      if (value != null) {
        wishListResponseModel = value;
        emit(ShowWishListloadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> addToWishList(
      AddToWishListEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishListloadingState());
    await HomeRepo.addToWishList(productId: event.productId).then((value) {
      if (value) {
        emit(AddToWishListloadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> removeFromWishList(
      RemoveFormWishListEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFormWishListloadingState());
    await HomeRepo.removeFromWishList(productId: event.productId).then((value) {
      if (value) {
        emit(RemoveFromWishListloadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  //Cart
  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(ShowCartloadingState());
    await HomeRepo.getCart().then((value) {
      if (value != null) {
        cartResponseModel = value;
        emit(ShowCartloadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartloadingState());
    await HomeRepo.addToCart(productId: event.productId).then((value) async {
      if (value) {
        await HomeRepo.getCart().then((cartValue) {
          if (cartValue != null) {
            cartResponseModel = cartValue;
            emit(ShowCartloadedState());
          } else {
            emit(HomeErrorState());
          }
        });
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> removeFromCart(
      RemoveFormCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFormCartloadingState());
    await HomeRepo.removeFromCart(cartId: event.cartId).then((value) {
      if (value) {
        emit(RemoveFromCartloadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }
  
}
