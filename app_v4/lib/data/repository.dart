import 'package:intl/date_symbol_data_local.dart';

import 'models/league.dart';
import 'models/region.dart';
import 'models/team.dart';
import 'network_service.dart';
import 'models/game.dart';

class Repository {
  final NetworkService networkService = NetworkService();

// Get Data from all
  Future fetchData() async {
    Map<String, dynamic> allLeaguesListRaw =
        await networkService.fetchAllLeagues();
    //  List of all Leagues
    late List<League> allLeaguesList = [];
    allLeaguesListRaw.forEach((key, value) {
      allLeaguesList.add(League.fromJson(value));
    });
    for (var league in allLeaguesList) {
      if (league.leagueId != null) {
        Map<String, dynamic> teamsOfLeagueRaw =
            await networkService.fetchTeamsOfLeague(league.leagueId!.toInt());
        late List<Team> teamsList = [];
        teamsOfLeagueRaw.forEach((key, value) {
          teamsList.add(Team.fromJson(value));
        });
        league.leagueTeams = teamsList;
      }
    }
    //  List of Regions
    late List<Region> regionsListRaw = [];
    allLeaguesListRaw.forEach((key, value) {
      regionsListRaw.add(Region.fromJson(value));
    });
    Set filterDuplicates = <String>{};
    List<Region> regionsList = regionsListRaw
        .where((region) => filterDuplicates.add(region.regionName))
        .toList();
    for (var region in regionsList) {
      List<League> listOfRegionLeagues = [];
      for (var i = 0; i < allLeaguesList.length; i++) {
        if (region.regionName == allLeaguesList[i].regionName) {
          listOfRegionLeagues.add(allLeaguesList[i]);
        }
      }
      region.regionLeagues = listOfRegionLeagues;
    }

    return regionsList;
  }

//  Get Teams of one League
  Future fetchTeams(double leagueId) async {
    Map<String, dynamic> teamsListRaw =
        await networkService.fetchTeamsOfLeague(leagueId.toInt());
    late List<Team> teamsList = [];
    teamsListRaw.forEach((key, value) {
      teamsList.add(Team.fromJson(value));
    });
    return teamsList;
  }

//  Get team object
  Future fetchTeam(String teamId) async {
    initializeDateFormatting();
    //  1. Get list of all leagues
    Map<String, dynamic> allLeaguesListJson =
        await networkService.fetchAllLeagues();
    late List<Team> allTeamsList = [];
    late List<League> allLeaguesList = [];
    allLeaguesListJson
        .forEach((key, value) => allLeaguesList.add(League.fromJson(value)));

    //  2. Create list of all teams in all leagues
    for (var league in allLeaguesList) {
      if (league.leagueId != null) {
        Map<String, dynamic> teamsOfLeagueJson =
            await networkService.fetchTeamsOfLeague(league.leagueId!.toInt());
        teamsOfLeagueJson
            .forEach((key, value) => allTeamsList.add(Team.fromJson(value)));
      }
    }
    // 3. Filter team object
    Team team = allTeamsList.firstWhere((team) => team.teamId == teamId);

    // 4. Add league name to object
    League teamLeague =
        allLeaguesList.firstWhere((league) => league.leagueId == team.leagueId);
    team.leagueName = teamLeague.leagueName;

// Get and add all games from team
    // 1. Get all games data of league
    Map<String, dynamic> allGamesFromTeamJson =
        await networkService.fetchGames(team.leagueId!);
    List<Game> rawAllGamesOfLeague = [];
    // 2. Create List of match objects our of all games
    allGamesFromTeamJson.forEach((key, value) {
      rawAllGamesOfLeague.add(Game.fromJson(value));
    });

    // 3. Get all games from team
    List<Game> gamesOfTeam = rawAllGamesOfLeague
        .where((match) =>
            match.homeTeamId == team.teamId || match.guestTeamId == team.teamId)
        .toList();

    team.games = gamesOfTeam;

// Get team squad list
    // Map<String, dynamic> allLeaguesListJson =
    //     await networkService.fetchAllLeagues();

    return team;
  }

  getleagueTeamNames(leagueId) async {
    Map<String, dynamic> teamsOfLeagueJson =
        await networkService.fetchTeamsOfLeague(leagueId!);
    List<Team> leagueOfTeam = [];
    teamsOfLeagueJson
        .forEach((key, value) => leagueOfTeam.add(Team.fromJson(value)));

    Map<String, String> leagueTeamNames = {};
    for (var team in leagueOfTeam) {
      leagueTeamNames[team.teamId!] = team.teamName2!;
    }

    return leagueTeamNames;
  }
}
