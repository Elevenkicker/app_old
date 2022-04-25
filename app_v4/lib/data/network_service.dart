import 'dart:convert';

import 'package:http/http.dart';

const baseUrl = 'http://34.159.133.82:5000/';
const apiKey = 'apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy';
const getAllLeagues = 'get_all_leagues?';
const getTeamsOfLeague = 'get_teams_of_league?';

class NetworkService {
  Future<dynamic> fetchAllLeagues() async {
    try {
      final response = await get(Uri.parse(baseUrl + getAllLeagues + apiKey));
      Map<String, dynamic> map = jsonDecode(response.body);
      final leaguesList = map['result'];

      return leaguesList;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> fetchTeamsOfLeague(double leaugeId) async {
    try {
      final response = await get(Uri.parse(baseUrl +
          getTeamsOfLeague +
          apiKey +
          '&leagueId=${leaugeId.toInt()}'));
      Map<String, dynamic> map = jsonDecode(response.body);
      final teamsList = map['result'];
      return teamsList;
    } catch (e) {
      return e;
    }
  }
}
