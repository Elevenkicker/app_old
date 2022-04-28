import 'package:app_v4/presentation/pages/teamPage/widgets/games/games_tab.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/teamCubit/team_cubit.dart';
import 'widgets/overview_tab.dart';
import 'widgets/header_field.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({
    Key? key,
    @PathParam() required this.teamId,
  }) : super(key: key);

  final String teamId;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TeamCubit>(context).fetchTeam(teamId);
    return BlocBuilder<TeamCubit, TeamState>(
      builder: (context, state) {
        if (state is! TeamLoaded) {
          return const Scaffold(
            backgroundColor: Color.fromRGBO(16, 38, 102, 1),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            body: Column(
              children: [
                TeamDetailPageHeader(
                  team: state.team,
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
                      GamesTab(
                        team: state.team,
                        leagueTeamNames: state.leagueTeamNames,
                      ),
                      const Center(child: Text("Kader")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




// Um von einem Element in einer Route zu einem Element in einer anderen Route zu kommen:
// context.navigateTo( "Name der HauptRoute (MatchRoute)" (children: MatchRoute(matchId "Zu übergebende Argumente"))
