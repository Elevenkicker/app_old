class TeamModel {
  final int teamId;
  final String teamName;
  final int leagueId;
  final String leagueName;
  final int gamesPlayed;
  final int goalsScored;
  final int goalsConceded;
  final int points;

  const TeamModel({
    required this.teamId,
    required this.teamName,
    required this.leagueId,
    required this.leagueName,
    required this.gamesPlayed,
    required this.goalsScored,
    required this.goalsConceded,
    required this.points,
  });
}
