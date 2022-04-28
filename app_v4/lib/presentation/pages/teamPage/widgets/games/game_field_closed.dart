import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../data/models/team.dart';

class GameFieldClosed extends StatelessWidget {
  const GameFieldClosed({
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

  Color choosHomeColor(_homeGoals, _guestGoals, _homeColor, _guestColor) {
    if (_homeGoals > _guestGoals) {
      return _homeColor = Colors.green;
    } else if (_homeGoals < _guestGoals) {
      return _homeColor = Colors.red;
    } else {
      return _homeColor = Colors.blue;
    }
  }

  Color choosGuestColor(_homeGoals, _guestGoals, _homeColor, _guestColor) {
    if (_homeGoals > _guestGoals) {
      return _guestColor = Colors.red;
    } else if (_homeGoals < _guestGoals) {
      return _guestColor = Colors.green;
    } else {
      return _guestColor = Colors.blue;
    }
  }

  final Color _homeColor = Colors.blue;
  final Color _guestColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    int _homeGoals = team.games![i].homeGoals!.toInt();
    int _guestGoals = team.games![i].guestGoals!.toInt();

    return Column(
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
                    fontSize: 18,
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
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: choosHomeColor(
                      _homeGoals, _guestGoals, _homeColor, _guestColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '$_homeGoals',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'LeagueGothic',
                    ),
                  ),
                ),
              ),
              const Gap(5),
              const Text(
                ':',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'LeagueGothic',
                ),
              ),
              const Gap(5),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: choosGuestColor(
                      _homeGoals, _guestGoals, _homeColor, _guestColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '$_guestGoals',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'LeagueGothic',
                    ),
                  ),
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
                    fontSize: 18,
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
