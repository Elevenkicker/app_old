import 'package:app_v3/provider/4games/game_provider.dart';
import 'package:flutter/material.dart';

class GamesProvider with ChangeNotifier {
  final List<GameProvider> _teams = [
    GameProvider(
      id: 1,
      date: DateTime(2022, 1, 1),
      homeTeamId: 1,
      guestTeamId: 8,
      homeTeamGoals: 5,
      guestTeamGoals: 1,
    ),
    GameProvider(
      id: 2,
      date: DateTime(2022, 1, 2),
      homeTeamId: 2,
      guestTeamId: 7,
      homeTeamGoals: 2,
      guestTeamGoals: 3,
    ),
    GameProvider(
      id: 3,
      date: DateTime(2022, 1, 3),
      homeTeamId: 3,
      guestTeamId: 6,
      homeTeamGoals: 4,
      guestTeamGoals: 3,
    ),
    GameProvider(
      id: 4,
      date: DateTime(2022, 1, 4),
      homeTeamId: 4,
      guestTeamId: 5,
      homeTeamGoals: 0,
      guestTeamGoals: 2,
    ),
    GameProvider(
      id: 5,
      date: DateTime(2022, 1, 5),
      homeTeamId: 5,
      guestTeamId: 4,
      homeTeamGoals: 1,
      guestTeamGoals: 1,
    ),
    GameProvider(
      id: 6,
      date: DateTime(2022, 1, 6),
      homeTeamId: 6,
      guestTeamId: 3,
      homeTeamGoals: 2,
      guestTeamGoals: 4,
    ),
    GameProvider(
      id: 7,
      date: DateTime(2022, 1, 7),
      homeTeamId: 7,
      guestTeamId: 2,
      homeTeamGoals: 1,
      guestTeamGoals: 2,
    ),
    GameProvider(
      id: 8,
      date: DateTime(2022, 1, 8),
      homeTeamId: 8,
      guestTeamId: 1,
      homeTeamGoals: 3,
      guestTeamGoals: 0,
    ),
  ];

  List<GameProvider> get teams {
    return [..._teams];
  }

  void updateFavouriteTeams() {
    notifyListeners();
  }

  // List<GameProvider> get favouriteTeams {
  //   return _teams.where((team) => team.isFavourite).toList();
  // }

  // List<GameProvider> get nonFavouriteTeams {
  //   return _teams.where((team) => team.isFavourite == false).toList();
  // }

  GameProvider findById(int id) {
    return _teams.firstWhere((team) => team.id == id);
  }

  GameProvider getLast5Games(int id) {
    return _teams.firstWhere((team) => team.id == id);
  }
}
