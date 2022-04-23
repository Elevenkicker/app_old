import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'Widgets/2followedTeams/followed_teams_field.dart';
import 'Widgets/3followedLeagues/followed_leagues_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Elevenkicker",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: const [
              Gap(20),
              FollowedTeamsField(title: 'Players'),
              Gap(20),
              FollowedTeamsField(title: 'Teams'),
              Gap(20),
              FollowedLeaguesField(title: 'Leagues'),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
