class Team {
  final String regionName = 'Südbaden';
  final int regionId = 1;
  final int leagueId;
  final String clubId;
  final String teamId;
  final String teamName1;
  final String teamName2;
  bool isFavourite = false;

  Team({
    required this.leagueId,
    required this.clubId,
    required this.teamId,
    required this.teamName1,
    required this.teamName2,
  });
}
