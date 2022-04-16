import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  GameProvider({
    required this.id,
    required this.date,
    required this.homeTeamId,
    required this.guestTeamId,
    required this.homeTeamGoals,
    required this.guestTeamGoals,
  });

  final int id;
  final DateTime date;
  final int homeTeamId;
  final int guestTeamId;
  final int homeTeamGoals;
  final int guestTeamGoals;
}
