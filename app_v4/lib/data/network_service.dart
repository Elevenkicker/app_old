import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  Future<dynamic> fetchAllLeagues() async {
    try {
      final response = await get(Uri.parse(
          'http://34.159.133.82:5000/get_all_leagues?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy'));
      Map<String, dynamic> map = jsonDecode(response.body);
      final leaguesList = map['result'];
      return leaguesList;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> fetchTeamsOfLeague(int leaugeId) async {
    try {
      final response = await get(Uri.parse(
          'http://34.159.133.82:5000/get_teams_of_league?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy&leagueId=${leaugeId.toInt()}'));
      Map<String, dynamic> map = jsonDecode(response.body);
      final teamsList = map['result'];
      return teamsList;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> fetchGames(int leagueId) async {
    try {
      final response = await get(Uri.parse(
          'http://34.159.133.82:5000/get_games_of_league?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy&leagueId=$leagueId'));
      Map<String, dynamic> map = jsonDecode(response.body);
      final gamesList = map['result'];
      return gamesList;
    } catch (e) {
      return e;
    }
  }
}
