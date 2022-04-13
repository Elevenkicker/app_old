import 'package:flutter/material.dart';
import 'team.dart';

class TeamsProvider with ChangeNotifier {
  final List<Team> _teams = [
    Team(
      teamId: 1,
      teamName: "Team 1",
      leagueName: "League 1",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 25,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 2,
      teamName: "Team 2",
      leagueName: "League 2",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 13,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 3,
      teamName: "Team 3",
      leagueName: "League 3",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 30,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 4,
      teamName: "Team 4",
      leagueName: "League 4",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 10,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 5,
      teamName: "Team 1",
      leagueName: "League 1",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 25,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 6,
      teamName: "Team 2",
      leagueName: "League 2",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 13,
      leagueId: 1,
      isFavourite: false,
    ),
    Team(
      teamId: 7,
      teamName: "Team 3",
      leagueName: "League 3",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 30,
      leagueId: 2,
      isFavourite: false,
    ),
    Team(
      teamId: 8,
      teamName: "Team 4",
      leagueName: "League 4",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 10,
      leagueId: 2,
      isFavourite: false,
    ),
  ];

  List<Team> get teams {
    return [..._teams];
  }

  List<Team> get favouriteTeams {
    return _teams.where((team) => team.isFavourite).toList();
  }

  Team findById(int teamId) {
    return _teams.firstWhere((team) => team.teamId == teamId);
  }
}
