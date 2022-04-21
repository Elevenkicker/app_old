import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/2team/teams_provider.dart';
import '../../widgets/detail_screen_header.dart';
import 'widgets/1overview_tab.dart';

class TeamScreen extends StatefulWidget {
  static const screenName = "/teamScreen";

  const TeamScreen({Key? key}) : super(key: key);
  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    final teamId = ModalRoute.of(context)?.settings.arguments as int;
    final teamsData = Provider.of<TeamsProvider>(context);
    final team = Provider.of<TeamsProvider>(context).findById(teamId);

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
          centerTitle: true,
          title: const Text("Elevenkicker",
              style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
        ),
        body: Column(
          children: [
            DetailScreenHeader(
              id: team.id!,
              name: team.name!,
              igUsername: team.igUsername,
              fbUsername: team.fbUsername,
              isFavourite: team.isFavourite!,
              toggleFavouriteStatus: team.toggleFavouriteStatus,
              updateFavourites: teamsData.updateFavouriteTeams,
              object: team,
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
                  OverviewTab(teamId),
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
