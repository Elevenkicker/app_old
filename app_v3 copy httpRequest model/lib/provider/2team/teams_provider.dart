import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  TeamProvider({
    required this.id,
    required this.name,
    required this.parentId,
    required this.parentName,
    required this.gamesPlayed,
    required this.goalsScored,
    required this.goalsConceded,
    required this.points,
    required this.isFavourite,
  });

  final int id;
  final String name;
  final int parentId;
  final String parentName;
  final int gamesPlayed;
  final int goalsScored;
  final int goalsConceded;
  final int points;

  bool isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }
}

class TeamsProvider with ChangeNotifier {
  final List<TeamProvider> _teams = [
    TeamProvider(
      id: 1,
      name: "Team 1",
      parentName: "League 1",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 25,
      parentId: 1,
      isFavourite: true,
    ),
    TeamProvider(
      id: 2,
      name: "Team 2",
      parentName: "League 2",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 13,
      parentId: 1,
      isFavourite: true,
    ),
    TeamProvider(
      id: 3,
      name: "Team 3",
      parentName: "League 3",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 30,
      parentId: 1,
      isFavourite: false,
    ),
    TeamProvider(
      id: 4,
      name: "Team 4",
      parentName: "League 4",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 10,
      parentId: 1,
      isFavourite: false,
    ),
    TeamProvider(
      id: 5,
      name: "Team 1",
      parentName: "League 1",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 25,
      parentId: 1,
      isFavourite: false,
    ),
    TeamProvider(
      id: 6,
      name: "Team 2",
      parentName: "League 2",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 13,
      parentId: 1,
      isFavourite: false,
    ),
    TeamProvider(
      id: 7,
      name: "Team 3",
      parentName: "League 3",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 30,
      parentId: 2,
      isFavourite: false,
    ),
    TeamProvider(
      id: 8,
      name: "Team 4",
      parentName: "League 4",
      gamesPlayed: 15,
      goalsScored: 25,
      goalsConceded: 10,
      points: 10,
      parentId: 2,
      isFavourite: false,
    ),
  ];

  List<TeamProvider> get teams {
    return [..._teams];
  }

  void updateFavouriteTeams() {
    notifyListeners();
  }

  List<TeamProvider> get favouriteTeams {
    return _teams.where((team) => team.isFavourite).toList();
  }

  List<TeamProvider> get nonFavouriteTeams {
    return _teams.where((team) => team.isFavourite == false).toList();
  }

  TeamProvider findById(int id) {
    return _teams.firstWhere((team) => team.id == id);
  }

  TeamProvider getLast5Games(int id) {
    return _teams.firstWhere((team) => team.id == id);
  }
}
