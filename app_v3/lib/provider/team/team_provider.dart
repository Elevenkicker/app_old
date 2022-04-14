import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  TeamProvider({
    required this.teamId,
    required this.teamName,
    required this.leagueId,
    required this.leagueName,
    required this.gamesPlayed,
    required this.goalsScored,
    required this.goalsConceded,
    required this.points,
    required this.isFavourite,
  });

  final int teamId;
  final String teamName;
  final int leagueId;
  final String leagueName;
  final int gamesPlayed;
  final int goalsScored;
  final int goalsConceded;
  final int points;
  bool isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }
}
