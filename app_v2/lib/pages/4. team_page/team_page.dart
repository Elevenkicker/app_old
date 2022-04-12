import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data.dart';
import '../../models/2. team_model.dart';

class TeamPage extends StatefulWidget {
  static const pageName = "/teamPage";

  const TeamPage({Key? key}) : super(key: key);
  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  TeamModel getTeam(teamId) {
    return DUMMY_TEAMS.firstWhere((team) => team.teamId == teamId);
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final teamId = routeArguments["teamId"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Fußball App",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(16, 38, 102, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      child: Image.asset(
                        "assets/images/vereinslogos/$teamId.png",
                      ),
                    ),
                    const Gap(10),
                    Text(getTeam(teamId).teamName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
