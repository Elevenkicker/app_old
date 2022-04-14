import 'package:flutter/material.dart';
import 'team_provider.dart';

class TeamsProvider with ChangeNotifier {
  final List<TeamProvider> teams = [
    TeamProvider(
      teamId: 1,
      teamName: "Team 1",
      leagueName: "League 1",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 25,
      leagueId: 1,
      isFavourite: true,
    ),
    TeamProvider(
      teamId: 2,
      teamName: "Team 2",
      leagueName: "League 2",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 13,
      leagueId: 1,
      isFavourite: true,
    ),
    TeamProvider(
      teamId: 3,
      teamName: "Team 3",
      leagueName: "League 3",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 30,
      leagueId: 1,
      isFavourite: true,
    ),
    TeamProvider(
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
    TeamProvider(
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
    TeamProvider(
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
    TeamProvider(
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
    TeamProvider(
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

  // List<TeamProvider> get teams {
  //   return teams;
  // }

  List<TeamProvider> get favouriteTeams {
    return teams.where((team) => team.isFavourite).toList();
  }

  List<TeamProvider> get nonFavouriteTeams {
    return teams.where((team) => team.isFavourite == false).toList();
  }

  // toggleFavouriteStatus(TeamProvider team) {
  //   team.toggleFavouriteStatus();
  //   notifyListeners();
  // }

  TeamProvider findById(int teamId) {
    return teams.firstWhere((team) => team.teamId == teamId);
  }
}