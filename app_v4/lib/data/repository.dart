import 'models/league.dart';
import 'models/region.dart';
import 'models/team.dart';
import 'network_service.dart';

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
            await networkService.fetchTeamsOfLeague(league.leagueId!);
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

    print(regionsList[16].regionLeagues.length);

    // print(regionsList[16].regionLeagues[2].leagueName);
    // print(regionsList[16].regionLeagues[2].leagueTeams.length);

    // for (var item in regionsList[16].regionLeagues) {
    //   print(item.leagueName);
    // }

    return regionsList;
  }

// Get Teams of one League
  Future fetchTeams(double leagueId) async {
    Map<String, dynamic> teamsListRaw =
        await networkService.fetchTeamsOfLeague(leagueId);

    late List<Team> teamsList = [];

    teamsListRaw.forEach((key, value) {
      teamsList.add(Team.fromJson(value));
    });

    return teamsList;
  }

// Get one Team
  Future fetchTeam(String teamId, double leagueId) async {
    Map<String, dynamic> teamsListRaw =
        await networkService.fetchTeamsOfLeague(leagueId);

    late List<Team> teamsList = [];

    teamsListRaw.forEach((key, value) {
      teamsList.add(Team.fromJson(value));
    });

    Team team = teamsList.firstWhere((team) => team.teamId == teamId);

    return team;
  }
}
