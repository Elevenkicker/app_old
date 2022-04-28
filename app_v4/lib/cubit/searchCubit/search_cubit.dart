import 'dart:async';

import 'package:app_v4/data/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/region.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchLoading());

  final Repository repository = Repository();

  void fetchData() {
    emit(SearchLoading());
    Timer(
        const Duration(seconds: 0),
        () => repository.fetchData().then((regionList) {
              emit(SearchLoaded(regionsList: regionList));
            }));
  }
}
