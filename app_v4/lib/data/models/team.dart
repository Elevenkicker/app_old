class Team {
  Team({
    this.regionName,
    this.leagueId,
    this.clubId,
    this.teamId,
    this.teamName1,
    this.officialTeamName,
    this.teamName2,
    this.igUsername,
    this.fbUsername,
  });

  bool isFavourite = false;
  String? igUsername = "";
  String? fbUsername = "";
  late int regionId = 1;

  late String? clubId;
  late int? leagueId;
  late String? officialTeamName;
  late String? regionName;
  late String? teamId;
  late int? teamName1;
  late String? teamName2;

  Team.fromJson(Map value)
      : clubId = value['clubId'],
        leagueId = value['leagueId'],
        officialTeamName = value['officialName'],
        regionName = value['regionName'],
        teamId = value['teamId'],
        teamName1 = value['team_alternativeName1'],
        teamName2 = value['team_alternativeName2'];
}
