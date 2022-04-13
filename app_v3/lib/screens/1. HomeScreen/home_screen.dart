import 'package:app_v3/provider/2.%20team/teams_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'Widgets/2. FollowedTeams/1. followed_teams_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenName = "/homePage";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamsProvider(),
      child: Scaffold(
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
                  // FollowedLeagues(),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
