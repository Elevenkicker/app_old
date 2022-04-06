import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widgets/followed_leagues/followed_leagues.dart';
import 'widgets/followed_players/followed_players.dart';
import 'widgets/followed_teams/followed_teams.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                Gap(20),
                FollowedPlayers(title: "Abonnierte Spieler"),
                Gap(20),
                FollowedTeams(title: "Abonnierte Teams"),
                Gap(20),
                FollowedLeagues(title: "Abonnierte Ligen"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
