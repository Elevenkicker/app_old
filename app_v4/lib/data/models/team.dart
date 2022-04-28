import 'package:app_v4/data/models/player.dart';

import 'game.dart';

class Team {
  Team({
    this.regionName,
    this.teamLogo,
    this.leagueName,
    this.leagueId,
    this.clubId,
    this.teamId,
    this.teamName1,
    this.officialTeamName,
    this.teamName2,
    this.igUsername,
    this.fbUsername,
    this.squadList,
    this.games,
  });

  bool isFavourite = false;
  String? igUsername = "";
  String? fbUsername = "";
  late int regionId = 1;

  late String? clubId;
  late String? teamLogo;
  late int? leagueId;
  late String? leagueName;
  late String? officialTeamName;
  late String? regionName;
  late String? teamId;
  late int? teamName1;
  late String? teamName2;
  late List<Player>? squadList;
  late List<Game>? games;

  Team.fromJson(Map value)
      : clubId = value['clubId'],
        leagueId = value['leagueId'],
        officialTeamName = value['officialName'],
        regionName = value['regionName'],
        teamId = value['teamId'],
        teamName1 = value['team_alternativeName1'],
        teamName2 = value['team_alternativeName2'];
}
