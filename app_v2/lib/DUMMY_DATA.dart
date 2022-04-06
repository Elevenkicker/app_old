import 'package:app_v2/models/2.%20team_model.dart';

import 'models/1. player_model.dart';
import 'models/3. league_model.dart';

const DUMMY_PLAYERS = [
  PlayerModel(playerId: 1, playerName: "Player 1", teamName: "Team 1"),
  PlayerModel(playerId: 2, playerName: "Player 2", teamName: "Team 2"),
  PlayerModel(playerId: 3, playerName: "Player 3", teamName: "Team 3"),
  PlayerModel(playerId: 4, playerName: "Player 4", teamName: "Team 4"),
];

const DUMMY_TEAMS = [
  TeamModel(teamId: 1, teamName: "Team 1", teamLeagueName: "League 1"),
  TeamModel(teamId: 2, teamName: "Team 2", teamLeagueName: "League 2"),
  TeamModel(teamId: 3, teamName: "Team 3", teamLeagueName: "League 3"),
  TeamModel(teamId: 4, teamName: "Team 4", teamLeagueName: "League 4"),
];

const DUMMY_LEAGUES = [
  LeagueModel(
      leagueId: 1, leagueName: 'League 1', leagueRegionName: 'Südbaden'),
  LeagueModel(leagueId: 2, leagueName: 'League 2', leagueRegionName: 'Bayern'),
  LeagueModel(leagueId: 3, leagueName: 'League 3', leagueRegionName: 'Baden'),
  LeagueModel(
      leagueId: 4, leagueName: 'League 4', leagueRegionName: 'Würrtemberg'),
];
