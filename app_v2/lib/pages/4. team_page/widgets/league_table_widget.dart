import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data.dart';
import '../../../models/2. team_model.dart';

class LeagueTableWidget extends StatefulWidget {
  const LeagueTableWidget({
    Key? key,
    required this.leagueId,
  }) : super(key: key);

  final int? leagueId;

  @override
  State<LeagueTableWidget> createState() => _LeagueTableWidgetState();
}

class _LeagueTableWidgetState extends State<LeagueTableWidget> {
  @override
  Widget build(BuildContext context) {
    List<TeamModel> league =
        DUMMY_TEAMS.where((team) => team.leagueId == widget.leagueId).toList();

    league.sort((team1, team2) => team2.points.compareTo(team1.points));

    return ListView.builder(
        itemCount: league.length,
        itemBuilder: (context, index) {
          int platzierung = index + 1;
          return Container(
            color: const Color.fromRGBO(16, 38, 102, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: (platzierung == 1)
                          ? Colors.amber
                          : const Color.fromRGBO(16, 38, 102, 0),

                      // if (platzierung == 1) {
                      //   return Colors.amber
                      // } else if (platzierung == 1 || 2) {
                      //   return Colors.green
                      // } else if (platzierung == 1 || 2) {
                      //   return Colors.green[500]
                      // } else {
                      //   return Color.fromRGBO(16, 38, 102, 1)
                      // }
                    ),
                    width: 30,
                    child: Text(
                      "$platzierung.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Gap(5),
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          "assets/images/vereinslogos/${league[index].teamId}.png")),
                  const Gap(5),
                  Expanded(
                    child: Text(league[index].teamName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        )),
                  ),
                  const Gap(5),
                  SizedBox(
                    width: 38,
                    child: Text("${league[index].gamesPlayed}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 42,
                    child: Text(
                        "${league[index].goalsScored} : ${league[index].goalsConceded}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 27,
                    child: Text(
                        "${league[index].goalsScored - league[index].goalsConceded}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 44,
                    child: Text("${league[index].points}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
