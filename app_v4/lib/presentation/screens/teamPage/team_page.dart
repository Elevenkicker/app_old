import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../data/models/team.dart';
import 'widgets/1overview_tab.dart';
import 'widgets/header_field.dart';

class TeamPage extends StatelessWidget {
  TeamPage({
    Key? key,
    @PathParam() required this.teamId,
  }) : super(key: key);

  final String teamId;

  final team = Team(
    leagueId: 335000,
    clubId: '00ES8GN9DO000013VV0AG08LVUPGND5I',
    teamId: '011MIANVN4000000VTVG0001VTR8C1K7',
    teamName1: 1,
    teamName2: 'SF Eintracht Freiburg',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        body: Column(
          children: [
            TeamDetailPageHeader(
              team: team,
            ),
            const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Übersicht"),
                Tab(text: "Tabelle"),
                Tab(text: "Spiele"),
                Tab(text: "Kader"),
              ],
            ),
            Container(height: 0.5, color: Colors.white54),
            Expanded(
              child: TabBarView(
                children: [
                  OverviewTab(team.teamId),
                  const Center(child: Text("Tabelle")),
                  const Center(child: Text("Spiele")),
                  const Center(child: Text("Kader")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Um von einem Element in einer Route zu einem Element in einer anderen Route zu kommen:
// context.navigateTo( "Name der HauptRoute (MatchRoute)" (children: MatchRoute(matchId "Zu übergebende Argumente"))
