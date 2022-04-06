import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'models/3. league_model.dart';
import 'models/2. team_model.dart';
import 'widgets/1. followed_players/followed_players.dart';
import 'widgets/2. followed_teams/followed_teams.dart';
import 'widgets/3. followed_leagues/followed_leagues.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TeamModel> favouriteTeams = [];
  final List<LeagueModel> favouriteLeagues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                Gap(20),
                FollowedPlayers(
                  title: "Abonnierte Spieler",
                ),
                Gap(20),
                FollowedTeams(
                  title: "Teams",
                ),
                Gap(20),
                FollowedLeagues(
                  title: "Ligen",
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
