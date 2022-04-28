import 'package:app_v4/data/models/team.dart';

class League {
  final String leagueType;
  final bool isActive;
  final String? leagueName;
  final int leagueHeight;
  final double? leagueId;
  final String regionName;

  List<Team> leagueTeams = [];

  bool isFavourite = false;

  League({
    required this.regionName,
    required this.leagueId,
    required this.leagueType,
    required this.leagueHeight,
    required this.leagueName,
    required this.isActive,
    required this.leagueTeams,
  });

  League.fromJson(Map json)
      : isActive = json['isActive'],
        leagueType = json['leagueType'],
        leagueName = json['leagueName'],
        leagueHeight = json['leagueHeight'],
        leagueId =
            json['leagueId'].runtimeType == String ? null : json['leagueId'],
        regionName = json['regionName'];
}
