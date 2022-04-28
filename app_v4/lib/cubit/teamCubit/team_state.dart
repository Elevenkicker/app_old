part of 'team_cubit.dart';

@immutable
abstract class TeamState {}

class TeamLoading extends TeamState {}

class TeamLoaded extends TeamState {
  final Team team;
  // final League leagueOfTeam;
  final Map<String, String> leagueTeamNames;

  TeamLoaded({
    required this.team,
    // required this.leagueOfTeam,
    required this.leagueTeamNames,
  });
}
