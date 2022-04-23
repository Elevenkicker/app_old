class Match {
  final int matchStatusId;
  final String leagueId;
  final String homeTeamId;
  final String guestTeamId;
  final String matchRound;
  final String matchNumber;
  final String date;
  final String homeTeamGoals;
  final String guestTeamGoals;

  Match({
    required this.matchStatusId,
    required this.leagueId,
    required this.homeTeamId,
    required this.guestTeamId,
    required this.matchRound,
    required this.matchNumber,
    required this.date,
    required this.homeTeamGoals,
    required this.guestTeamGoals,
  });
}
