import '../2. team/team.dart';

class LeagueModel {
  final int leagueId;
  final String leagueName;
  final String leagueRegionName;
  final int numberOfTeams;
  final List<Team> teams;
  const LeagueModel({
    required this.leagueId,
    required this.leagueName,
    required this.leagueRegionName,
    required this.numberOfTeams,
    required this.teams,
  });
}
