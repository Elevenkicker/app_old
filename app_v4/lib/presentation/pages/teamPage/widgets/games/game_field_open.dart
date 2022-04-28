import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../data/models/team.dart';

class GameFieldOpen extends StatelessWidget {
  const GameFieldOpen({
    Key? key,
    required this.team,
    required this.leagueTeamNames,
    required this.i,
    required this.gameTime,
  }) : super(key: key);

  final Team team;
  final Map leagueTeamNames;
  final int i;
  final String gameTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      // key: ,
      children: [
        Container(
          height: 66,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(25, 52, 129, 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${leagueTeamNames[team.games![i].homeTeamId]}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'LeagueGothic',
                  ),
                ),
              ),
              const Gap(5),
              SizedBox(
                height: 35,
                width: 35,
                child: Image.network(
                  'http://34.159.133.82:5000/get_team_logo?leagueId=${team.leagueId}&regionName=Südbaden&teamId=${team.games![i].homeTeamId}&apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy',
                ),
              ),
              const Gap(10),
              Text(
                gameTime.substring(0, 5),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'LeagueGothic',
                ),
              ),
              const Gap(10),
              SizedBox(
                height: 35,
                width: 35,
                child: Image.network(
                  'http://34.159.133.82:5000/get_team_logo?leagueId=${team.leagueId}&regionName=Südbaden&teamId=${team.games![i].guestTeamId}&apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy',
                ),
              ),
              const Gap(5),
              Expanded(
                child: Text(
                  "${leagueTeamNames[team.games![i].guestTeamId]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'LeagueGothic',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
