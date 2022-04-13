import 'package:app_v3/provider/2.%20team/teams_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TeamScreen extends StatefulWidget {
  static const screenName = "/teamScreen";

  const TeamScreen({Key? key}) : super(key: key);
  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final teamId = routeArguments["teamId"];

    // final loadedTeam = Provider.of<TeamsProvider>(context).findById(teamId);

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
                    const Text("loadedTeam.teamName",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
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
