import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  PlayerProvider({
    required this.id,
    required this.name,
    required this.role,
    required this.parentId,
    required this.parentName,
    required this.isFavourite,
  });

  int id;
  String name;
  String role;
  int parentId;
  String parentName;

  bool isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }
}

class PlayersProvider with ChangeNotifier {
  final List<PlayerProvider> _players = <PlayerProvider>[
    PlayerProvider(
      id: 1,
      name: "PlayerName 1",
      role: "Spieler",
      parentId: 1,
      parentName: "Team 1",
      isFavourite: false,
    ),
    PlayerProvider(
      id: 2,
      name: "PlayerName 2",
      role: "Spieler",
      parentId: 2,
      parentName: "Team 2",
      isFavourite: false,
    ),
    PlayerProvider(
      id: 3,
      name: "PlayerName 3",
      role: "Spieler",
      parentId: 3,
      parentName: "Team 3",
      isFavourite: false,
    ),
    PlayerProvider(
      id: 4,
      name: "PlayerName 4",
      role: "Reserve",
      parentId: 4,
      parentName: "Team 4",
      isFavourite: false,
    ),
    PlayerProvider(
      id: 5,
      name: "PlayerName 5",
      role: "Reserve",
      parentId: 5,
      parentName: "Team 5",
      isFavourite: false,
    ),
  ];

  List<PlayerProvider> get players {
    return [..._players];
  }

  void updateFavouritePlayers() {
    notifyListeners();
  }

  List<PlayerProvider> get favouritePlayers {
    return _players.where((player) => player.isFavourite).toList();
  }

  List<PlayerProvider> get nonFavouritePlayers {
    return _players.where((player) => player.isFavourite == false).toList();
  }

  PlayerProvider findById(int id) {
    return _players.firstWhere((player) => player.id == id);
  }
}
