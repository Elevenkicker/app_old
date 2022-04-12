import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widgets/league_table.dart';
import 'widgets/leaguepage_header.dart';

class LeaguePage extends StatefulWidget {
  static const pageName = "/leaguePage";

  const LeaguePage({
    Key? key,
  }) : super(key: key);
  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  final int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final leagueId = routeArguments["leagueId"];
    final leagueName = routeArguments["leagueName"];
    final leagueRegionName = routeArguments["RegionLeagueName"];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromRGBO(16, 38, 102, 1),
          child: Column(
            children: [
              const Gap(40),
              LeaguePageHeader(leagueId: leagueId, leagueName: leagueName),
              const TabBar(tabs: [
                Tab(text: "Übersicht"),
                Tab(text: "Tabelle"),
                Tab(text: "Spiele"),
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    const Center(
                        child: Text("Übersicht",
                            style: TextStyle(color: Colors.white))),
                    LeagueTable(leagueId: leagueId),
                    const Center(
                        child: Text("Spiele",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
