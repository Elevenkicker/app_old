import 'package:app_v1/2.%20application/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'widgets/1. followed_players/followed_players.dart';
import 'widgets/2. followed_teams/followed_teams.dart';
import 'widgets/3. followed_leagues/followed_leagues.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageBloc = HomepageBloc();

  void addFavouritePlayerEvent() {
    homePageBloc.add(AddFavouritePlayerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<HomepageBloc, HomepageState>(
              bloc: homePageBloc,
              builder: (BuildContext context, homePageState) {
                if (homePageState is HomepageInitial) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Gap(20),
                        FollowedPlayers(
                            title: "Abonnierte Spieler",
                            addFavouritePlayerEvent: addFavouritePlayerEvent),
                        const Gap(20),
                        const FollowedTeams(title: "Teams"),
                        const Gap(20),
                        const FollowedLeagues(title: "Ligen"),
                        const Gap(20),
                      ],
                    ),
                  );
                } else if (homePageState is HomepagePlayerSearchLoading) {
                  return const CircularProgressIndicator();
                } else if (homePageState is HomepagePlayerSearchLoaded) {
                  return const Text(
                    "Player Search Page",
                    style: TextStyle(color: Colors.white),
                  );
                } else if (homePageState is HomepageError) {
                  return const Text(
                    "Error",
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return const Text(
                    "Unexpected Error",
                    style: TextStyle(color: Colors.white),
                  );
                }
              }),
        ),
      ),
    );
  }
}
