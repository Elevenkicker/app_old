import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../7appDrawer/custom_app_drawer.dart';
import 'widgets/team_management_infos.dart';
import 'widgets/team_management_player.dart';
import 'widgets/team_management_staff.dart';

class TeamManagerScreen extends StatelessWidget {
  const TeamManagerScreen({Key? key}) : super(key: key);

  static const screenName = "/teamManagerScreen";

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
      drawer: const CustomAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const Gap(20),
                const Text("Team Management",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "Elenvenkicker",
                      fontWeight: FontWeight.w700,
                    )),
                const Gap(20),
                Container(
                    height: 1,
                    decoration: const BoxDecoration(color: Colors.white)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Column(
                children: const [
                  TeamManagementInfos(),
                  Gap(20),
                  TeamManagementTrainerstab(),
                  Gap(20),
                  TeamManagementSpieler(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
