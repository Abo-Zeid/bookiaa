import 'package:bokiaa/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bokiaa/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bokiaa/feature/home/data/repo/home_repo.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_event.dart';
import 'package:bokiaa/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeIntial()) {
    on<GetBestSellerEvent>(getBestSellerBooks);
    on<GetHomeBannerEvent>(getHomeBanner);
    add(GetBestSellerEvent());
    add(GetHomeBannerEvent());
  }
  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;

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
}
