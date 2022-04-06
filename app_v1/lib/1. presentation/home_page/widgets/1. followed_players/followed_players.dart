import 'package:app_v1/2.%20application/favourite_player_bloc/bloc/favouriteplayers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../models/player_model.dart';
import 'player_field.dart';

class FollowedPlayers extends StatelessWidget {
  FollowedPlayers({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<PlayerModel> favouritePlayers = [];

  final favouritePlayersBloc = FavouriteplayersBloc();

  void addFavouritePlayerEvent() {
    favouritePlayersBloc.add(AddFavouritePlayerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(16, 38, 102, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BlocBuilder<FavouriteplayersBloc, FavouriteplayersState>(
                  bloc: favouritePlayersBloc,
                  builder: (BuildContext context,
                      FavouriteplayersState favouriteplayersState) {
                    if (favouriteplayersState is FavouriteplayersInitial) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: favouritePlayers.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(10),
                        itemBuilder: (BuildContext context, int index) =>
                            PlayerField(
                                playerName: favouritePlayers[index].playerName,
                                playerTeamName:
                                    favouritePlayers[index].teamName),
                      );
                    } else if (favouriteplayersState
                        is LoadingPlayerSearchPage) {
                      return const CircularProgressIndicator();
                    } else if (favouriteplayersState is AddPlayer) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: favouriteplayersState.favouritPlayers.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(10),
                        itemBuilder: (BuildContext context, int index) =>
                            PlayerField(
                                playerName: favouriteplayersState
                                    .favouritPlayers[index].playerName,
                                playerTeamName: favouriteplayersState
                                    .favouritPlayers[index].teamName),
                      );
                    } else {
                      return const Text(
                        "Unexpected Error",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  },
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(35, 60, 128, 1)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: () {
                    print("Add Player Button was pressed");
                    addFavouritePlayerEvent();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
