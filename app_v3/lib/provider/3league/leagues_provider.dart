import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeagueProvider with ChangeNotifier {
  LeagueProvider({
    this.leagueType,
    this.name,
    this.ligaHeight,
    this.id,
    this.parentName,
  });
  late String? leagueType;
  bool? isActive = false;
  late String? name;
  late int? ligaHeight;
  late String? id;
  late String? parentName;
  bool? isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite!;
  }
}

class LeaguesProvider with ChangeNotifier {
  List<LeagueProvider> allLeagues = [
    LeagueProvider(
      id: "999",
      leagueType: "Test League",
      ligaHeight: 0,
      name: "Test Name",
      parentName: "Test Region",
    ),
  ];

  late int lengthOfSection;

  Future<void> getAllLeagues() async {
    const url =
        "http://34.159.133.82:5000/get_all_leagues?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy";

    late int lengthOfSection;

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as Map;

      Map leagueData = jsonData["result"];

      lengthOfSection = leagueData["gameLeague"].length;

      allLeagues = List.generate(lengthOfSection, (index) => LeagueProvider());

      for (var section in leagueData.keys) {
        print(section);
        for (var i = 0; i < lengthOfSection; i++) {
          if (section == "gameLeague") {
            allLeagues[i].leagueType = leagueData[section]['$i'];
          } else if (section == "isActive") {
            allLeagues[i].isActive = leagueData[section]['$i'];
          } else if (section == 'league') {
            allLeagues[i].name = leagueData[section]['$i'];
          } else if (section == 'leagueHeight') {
            allLeagues[i].ligaHeight = leagueData[section]['$i'];
          } else if (section == 'leagueId') {
            if (allLeagues[i].id.runtimeType == String) {
              allLeagues[i].id = "Inactive";
            } else if (allLeagues[i].id.runtimeType == double) {
              allLeagues[i].id = leagueData[section]['$i'] as String;
            }
          } else if (section == 'region') {
            allLeagues[i].parentName = leagueData[section]['$i'];
          }
        }
      }
    } on Exception catch (e) {
      print(e);
    }

    allLeagues.removeWhere((league) => league.isActive == false);
    notifyListeners();
  }

  void updateFavouriteLeagues() {
    notifyListeners();
  }

  List<LeagueProvider> get favouriteLeagues {
    return allLeagues.where((team) => team.isFavourite!).toList();
  }

  List<LeagueProvider> get nonFavouriteLeagues {
    return allLeagues.where((team) => team.isFavourite == false).toList();
  }

  LeagueProvider findById(int id) {
    return allLeagues.firstWhere((league) => league.id == id);
  }
}
