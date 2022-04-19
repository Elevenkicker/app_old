import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'Widgets/1followedPlayers/1followed_players_field.dart';
import 'Widgets/2followedTeams/1followed_teams_field.dart';
import 'Widgets/3followedLeagues/1followed_leagues_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            Gap(20),
            FollowedPlayersField(),
            Gap(20),
            FollowedTeamsField(),
            Gap(20),
            FollowedLeagueField(),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
