import 'package:bokiaa/feature/profile/data/models/profile_response_model/profile_response_model.dart';
import 'package:bokiaa/feature/profile/data/repo/profile_repo.dart';
import 'package:bokiaa/feature/profile/presentation/bloc/profile_event.dart';
import 'package:bokiaa/feature/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileDetailsEvent>(getProfileDetails);

    add(GetProfileDetailsEvent());
  }
  ProfileResponseModel? profileResponseModel;

  Future<void> getProfileDetails(
      GetProfileDetailsEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    ProfileRepo.getProfileDetails().then((value) {
      if (value != null) {
        profileResponseModel = value;
        emit(ProfileLoadedState());
      } else {
        emit(ProfileErrorState());
      }
    });
  }
}
