import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  Future sleep1() {
    return Future.delayed(const Duration(seconds: 2), () => 1);
  }

  HomepageBloc() : super(HomepageInitial()) {
    on<AddFavouritePlayerEvent>((event, emit) async {
      emit(HomepagePlayerSearchLoading());

      // Do something:
      await sleep1(); // Fake Request

      // Open Search to add a Favourite Player
      emit(HomepagePlayerSearchLoaded());
    });

    on<OpenPlayerPageEvent>((event, emit) {});
  }
}
