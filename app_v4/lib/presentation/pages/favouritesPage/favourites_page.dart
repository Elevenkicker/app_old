import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'Widgets/followedLeagues/followed_leagues_field.dart';
import 'Widgets/followedPlayers/followed_players_field.dart';
import 'Widgets/followedTeams/followed_teams_field.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Gap(20),
              FollowedPlayersField(title: 'Players'),
              const Gap(20),
              FollowedTeamsField(title: 'Teams'),
              const Gap(20),
              const FollowedLeaguesField(title: 'Leagues'),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
