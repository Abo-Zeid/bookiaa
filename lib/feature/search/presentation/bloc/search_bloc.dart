import 'dart:developer';

import 'package:bokiaa/feature/search/data/models/response/search_response_model/search_response_model.dart';
import 'package:bokiaa/feature/search/data/repo/search_repo.dart';
import 'package:bokiaa/feature/search/presentation/bloc/search_event.dart';
import 'package:bokiaa/feature/search/presentation/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<GetSearchEvent>(getSearchBooks);
  }
  TextEditingController searchController = TextEditingController();
  SearchResponseModel? searchResponseModel;

  Future<void> getSearchBooks(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    log("error");
    emit(SearchLoadingState());
    await SearchRepo.getSearchBooks(event.text).then((value) {
      log("error hered$value");
      if (value != null) {
        searchResponseModel = value;
        emit(SearchLoadedState());
      } else {
        emit(SearchErrorState());
      }
    }).catchError((e) {
      log(e.toString());
    });
  }
}
