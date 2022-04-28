import 'package:app_v4/data/models/game.dart';
import 'package:app_v4/presentation/pages/teamPage/widgets/games/game_field_cancelled.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../data/models/team.dart';
import 'game_field_closed.dart';
import 'game_field_open.dart';

class GamesTab extends StatelessWidget {
  GamesTab({
    Key? key,
    required this.team,
    required this.leagueTeamNames,
  }) : super(key: key);

  final Team team;
  final Map leagueTeamNames;

  String previousWeek = 'Letzte Woche';
  String yesterday = 'Gestern';
  String today = 'Heute';
  String tomorrow = 'Morgen';
  String nextWeek = 'Nächste Woche';

  String title = '';

  DateTime now = DateTime.now();

  final itemKey = GlobalKey();

  // Future scrollToItem(context) async {
  //   final context = itemKey.currentContext!;
  //   await Scrollable.ensureVisible(context);
  // }

  @override
  Widget build(BuildContext context) {
    DateTime dayNow = DateTime.now();
    DateTime dateToday = DateTime(dayNow.year, dayNow.month, dayNow.day);

    if (team.games!.any((game) => game.gameDate != dateToday)) {
      Game firstGameAfterToday =
          team.games!.firstWhere((game) => game.gameDate!.isAfter(dayNow));

      int indexOfFirstGameAfterToday = team.games!
          .indexWhere((game) => game.gameDate == firstGameAfterToday.gameDate);

      Game placeHolderGame = Game(
          gameDate: dayNow,
          gameTime: "",
          gameStatusId: 0,
          homeTeamId: "",
          guestTeamId: "",
          gameRound: 0,
          guestGoals: 0,
          homeGoals: 0);

      team.games!.insert(indexOfFirstGameAfterToday, placeHolderGame);
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Expanded(
          child: ListView.separated(
            itemCount: team.games!.length,
            separatorBuilder: (context, i) => const Gap(10),
            itemBuilder: (context, i) {
              DateTime gameDate = team.games![i].gameDate!;
              String? gameDateString = team.games![i].gameDateString;

              String gameTime = team.games![i].gameTime!;
              int daysCompareToToday = DateTime(
                      team.games![i].gameDate!.year,
                      team.games![i].gameDate!.month,
                      team.games![i].gameDate!.day)
                  .difference(now)
                  .inDays;

              if (daysCompareToToday < -1 && daysCompareToToday > -7) {
                title = previousWeek;
              } else if (daysCompareToToday == -1) {
                title = yesterday;
              } else if (daysCompareToToday == 0) {
                title = today;
              } else if (daysCompareToToday == 1) {
                title = tomorrow;
              } else if (daysCompareToToday > 1 && daysCompareToToday < 7) {
                title = nextWeek;
              } else {
                title = gameDateString!;
              }

              switch (gameDate == dayNow) {
                case true:
                  switch (team.games![i].gameStatusId) {
                    case 300:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            key: itemKey,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const Gap(15),
                          GameFieldOpen(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                    case 600:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            key: itemKey,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const Gap(15),
                          GameFieldClosed(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                    case 0:
                      return Column(
                        children: [
                          const Gap(20),
                          Container(
                            key: itemKey,
                            height: 80,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(25, 52, 129, 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Gap(10),
                                Icon(
                                  Icons.not_interested,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                Gap(10),
                                Text(
                                  'Kein Spiel heute',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(15),
                          GameFieldClosed(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                    default:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            key: itemKey,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 35),
                          ),
                          const Gap(15),
                          GameFieldCancelled(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                  }
                case false:
                  switch (team.games![i].gameStatusId) {
                    case 300:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const Gap(15),
                          GameFieldOpen(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                    case 600:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const Gap(15),
                          GameFieldClosed(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                    default:
                      return Column(
                        children: [
                          const Gap(20),
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 35),
                          ),
                          const Gap(15),
                          GameFieldCancelled(
                            team: team,
                            leagueTeamNames: leagueTeamNames,
                            i: i,
                            gameTime: gameTime,
                          ),
                        ],
                      );
                  }

                default:
                  return const Gap(0);
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'Heute',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          // scrollToItem(context);
          Scrollable.ensureVisible(itemKey.currentContext!);
          print(itemKey.runtimeType);
        },
      ),
    );
  }
}
