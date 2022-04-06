import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/player_model.dart';

part 'favouriteplayers_event.dart';
part 'favouriteplayers_state.dart';

class FavouriteplayersBloc
    extends Bloc<FavouriteplayersEvent, FavouriteplayersState> {
  FavouriteplayersBloc() : super(FavouriteplayersInitial()) {
    Future sleep1() {
      return Future.delayed(const Duration(seconds: 2), () => 1);
    }

    on<AddFavouritePlayerEvent>((event, emit) async {
      emit(LoadingPlayerSearchPage());

      // Do something:
      await sleep1(); // Fake Request

      // emit(OpenPlayerSearchPage()); // Search Page Open and whaiting a Player to be selected

      final List<PlayerModel> favouritPlayers = [
        PlayerModel(playerName: "Flavio Aliu", teamName: "SC Freiburg"),
        PlayerModel(playerName: "Stefan Meier", teamName: "Borussia Dortmund"),
        PlayerModel(playerName: "Alex Schulz", teamName: "VfB Stuttgart"),
      ];

      // Open Search to add a Favourite Player
      emit(AddPlayer(favouritPlayers: favouritPlayers));
    });
  }
}
