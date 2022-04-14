import 'package:flutter/material.dart';

import '../team/team_provider.dart';
import '../team/teams_provider.dart';
import 'league_provider.dart';

class LeaguesProvider with ChangeNotifier {
  final List<LeagueProvider> _leagues = [
    LeagueProvider(
      leagueId: 1,
      leagueName: 'League 1',
      leagueRegionName: 'Südbaden',
      numberOfTeams: 17,
      isFavourite: false,
    ),
    LeagueProvider(
      leagueId: 2,
      leagueName: 'League 2',
      leagueRegionName: 'Bayern',
      numberOfTeams: 16,
      isFavourite: false,
    ),
    LeagueProvider(
      leagueId: 3,
      leagueName: 'League 3',
      leagueRegionName: 'Baden',
      numberOfTeams: 17,
      isFavourite: false,
    ),
    LeagueProvider(
      leagueId: 4,
      leagueName: 'League 4',
      leagueRegionName: 'Würrtemberg',
      numberOfTeams: 21,
      isFavourite: false,
    ),
  ];

  List<TeamProvider> getTeamsOfLeague(int leagueId) {
    TeamsProvider allTeams = TeamsProvider();
    return allTeams.teams.where((team) => team.leagueId == leagueId).toList();
  }

  List<LeagueProvider> get leagues {
    return [..._leagues];
  }

  List<LeagueProvider> get favouriteLeagues {
    return _leagues.where((team) => team.isFavourite).toList();
  }

  List<LeagueProvider> get nonFavouriteLeagues {
    return _leagues.where((team) => team.isFavourite == false).toList();
  }

  LeagueProvider findById(int leagueId) {
    return _leagues.firstWhere((league) => league.leagueId == leagueId);
  }
}
