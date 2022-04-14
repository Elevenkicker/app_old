import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../provider/team/teams_provider.dart';
import 'Widgets/followedLeagues/followed_leagues_field.dart';
import 'Widgets/followedTeams/1. followed_teams_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenName = "/homePage";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                // FollowedPlayers(),
                Gap(20),
                FollowedTeamsField(),
                Gap(20),
                FollowedLeagueField(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
