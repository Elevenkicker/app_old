import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widgets/1. followed_players/followed_players_field.dart';
import 'widgets/2. followed_teams/followed_teams_field.dart';
import 'widgets/3. followed_leagues/followed_leagues_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const pageName = "/homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: const [
                Gap(20),
                FollowedPlayers(),
                Gap(20),
                FollowedTeams(),
                Gap(20),
                FollowedLeagues(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
