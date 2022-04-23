class League {
  final int regionId;
  final double leagueId;
  final String leagueType;
  final int leagueHeight;
  final String leagueName;
  final bool isActive;
  bool isFavourite = false;

  League({
    required this.regionId,
    required this.leagueId,
    required this.leagueType,
    required this.leagueHeight,
    required this.leagueName,
    required this.isActive,
  });
}
