part of 'team_cubit.dart';

@immutable
abstract class TeamState {}

class TeamLoading extends TeamState {}

class TeamLoaded extends TeamState {
  final Team team;

  TeamLoaded({required this.team});
}
