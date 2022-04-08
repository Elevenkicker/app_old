import '2. team_model.dart';

class LeagueModel {
  final int leagueId;
  final String leagueName;
  final String leagueRegionName;
  final int numberOfTeams;
  final List<TeamModel> teams;
  const LeagueModel({
    required this.leagueId,
    required this.leagueName,
    required this.leagueRegionName,
    required this.numberOfTeams,
    required this.teams,
  });
}
