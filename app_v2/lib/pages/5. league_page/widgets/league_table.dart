import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data.dart';
import '../../../models/2. team_model.dart';
import 'league_table_body_element.dart';
import 'league_table_header_element.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({
    Key? key,
    required this.leagueId,
  }) : super(key: key);

  final int? leagueId;

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  void selectTeam(BuildContext context, {teamId}) {
    Navigator.of(context).pushNamed("/teamPage", arguments: {
      "teamId": teamId,
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TeamModel> league =
        DUMMY_TEAMS.where((team) => team.leagueId == widget.leagueId).toList();

    league.sort((team1, team2) => team2.points.compareTo(team1.points));

    return Column(
      children: [
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              leagueTableHeaderElement(title: "Pl.", width: 30),
              Gap(40),
              Expanded(
                  child: Text("Mannschaft",
                      style: TextStyle(color: Colors.white))),
              Gap(5),
              leagueTableHeaderElement(title: "Spiele", width: 41),
              Gap(10),
              leagueTableHeaderElement(title: "Tore", width: 42),
              Gap(10),
              leagueTableHeaderElement(title: "Diff.", width: 28),
              Gap(10),
              leagueTableHeaderElement(title: "Punkte", width: 47),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 0.5,
          width: double.infinity,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: league.length,
            separatorBuilder: (context, index) {
              int platzierung = index + 1;

              if ((platzierung == 1)) {
                return SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Gap(85),
                      Text(
                        "MEISTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Divider(
                height: 0.25,
                color: Colors.white54,
                thickness: 0.50,
              );
            },
            itemBuilder: (context, index) {
              int platzierung = index + 1;
              return InkWell(
                child: Container(
                  color: const Color.fromRGBO(25, 50, 125, 1),
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: (platzierung == 1)
                                ? Colors.amber
                                : const Color.fromRGBO(16, 38, 102, 0),
                          ),
                          child: LeagueTableBodyElement(
                              title: "$platzierung.", fontSize: 20, width: 30),
                        ),
                        const Gap(5),
                        SizedBox(
                            width: 30,
                            child: Image.asset(
                                "assets/images/vereinslogos/${league[index].teamId}.png")),
                        const Gap(5),
                        Expanded(
                          child: Text(league[index].teamName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        const Gap(5),
                        LeagueTableBodyElement(
                            title: "${league[index].gamesPlayed}",
                            fontSize: 14,
                            width: 41),
                        const Gap(10),
                        LeagueTableBodyElement(
                            title:
                                "${league[index].goalsScored} : ${league[index].goalsConceded}",
                            fontSize: 14,
                            width: 42),
                        const Gap(10),
                        LeagueTableBodyElement(
                            title:
                                "${league[index].goalsScored - league[index].goalsConceded}",
                            fontSize: 14,
                            width: 28),
                        const Gap(10),
                        LeagueTableBodyElement(
                            title: "${league[index].points}",
                            fontSize: 18,
                            width: 47),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  selectTeam(context, teamId: league[index].teamId);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
