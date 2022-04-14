import 'package:flutter/material.dart';

class LeagueProvider with ChangeNotifier {
  LeagueProvider({
    required this.leagueId,
    required this.leagueName,
    required this.leagueRegionName,
    required this.numberOfTeams,
    required this.isFavourite,
  });

  final int leagueId;
  final String leagueName;
  final String leagueRegionName;
  final int numberOfTeams;

  bool isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
