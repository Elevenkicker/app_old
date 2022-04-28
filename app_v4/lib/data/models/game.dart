import 'package:intl/intl.dart';

class Game {
  Game({
    required this.gameDate,
    required this.gameTime,
    required this.gameStatusId,
    required this.homeTeamId,
    required this.guestTeamId,
    required this.gameRound,
    required this.guestGoals,
    required this.homeGoals,
  });

  DateTime? gameDate;
  String? gameDateString;
  String? gameTime;
  int? gameStatusId;
  String? guestTeamId;
  String? homeTeamId;
  int? gameRound;
  double? guestGoals;
  double? homeGoals;

  Game.fromJson(value) {
    DateTime rawFormatedgameDate =
        DateFormat('yyyy-MM-dd').parse(value['gameDate']);
    DateFormat dateFormat1 = DateFormat('EEEE, dd. MMMM', 'de');
    String formatedgameDate = dateFormat1.format(rawFormatedgameDate);
    gameDate = rawFormatedgameDate;
    gameDateString = formatedgameDate;
    gameTime = value['gameTime'];
    gameStatusId = value['gamestatusId'];
    guestTeamId = value['guestTeamId'];
    homeTeamId = value['homeTeamId'];
    gameRound = value['matchday'];
    guestGoals = value['resultGuest'].runtimeType == double
        ? value['resultGuest']
        : null;
    homeGoals =
        value['resultHome'].runtimeType == double ? value['resultHome'] : null;
  }
}
