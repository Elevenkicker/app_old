// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

import '../presentation/home_page.dart' as _i1;
import '../presentation/screens/favouritesPage/favourites_page.dart' as _i3;
import '../presentation/screens/leaguePage/league_page.dart' as _i5;
import '../presentation/screens/matchesPage/matches_page.dart' as _i7;
import '../presentation/screens/matchPage/match_page.dart' as _i8;
import '../presentation/screens/searchPage/search_page.dart' as _i6;
import '../presentation/screens/teamPage/team_page.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    FavouritesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    MatchesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    FavouritesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.FavouritesPage());
    },
    TeamRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TeamRouteArgs>(
          orElse: () => TeamRouteArgs(teamId: pathParams.getString('teamId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.TeamPage(key: args.key, teamId: args.teamId));
    },
    LeagueRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LeagueRouteArgs>(
          orElse: () =>
              LeagueRouteArgs(leagueId: pathParams.getString('leagueId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LeaguePage(key: args.key, leagueId: args.leagueId));
    },
    SearchRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SearchPage());
    },
    MatchesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.MatchesPage());
    },
    MatchRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MatchRouteArgs>(
          orElse: () =>
              MatchRouteArgs(matchId: pathParams.getString('matchId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.MatchPage(key: args.key, matchId: args.matchId));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(FavouritesRouter.name,
              path: 'favourites',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(FavouritesRoute.name,
                    path: '', parent: FavouritesRouter.name),
                _i2.RouteConfig(TeamRoute.name,
                    path: ':teamId', parent: FavouritesRouter.name),
                _i2.RouteConfig(LeagueRoute.name,
                    path: ':leagueId', parent: FavouritesRouter.name)
              ]),
          _i2.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name),
                _i2.RouteConfig(TeamRoute.name,
                    path: ':teamId', parent: SearchRouter.name),
                _i2.RouteConfig(LeagueRoute.name,
                    path: ':leagueId', parent: SearchRouter.name)
              ]),
          _i2.RouteConfig(MatchesRouter.name,
              path: 'matches',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(MatchesRoute.name,
                    path: '', parent: MatchesRouter.name),
                _i2.RouteConfig(MatchRoute.name,
                    path: ':matchId', parent: MatchesRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FavouritesRouter extends _i2.PageRouteInfo<void> {
  const FavouritesRouter({List<_i2.PageRouteInfo>? children})
      : super(FavouritesRouter.name,
            path: 'favourites', initialChildren: children);

  static const String name = 'FavouritesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SearchRouter extends _i2.PageRouteInfo<void> {
  const SearchRouter({List<_i2.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class MatchesRouter extends _i2.PageRouteInfo<void> {
  const MatchesRouter({List<_i2.PageRouteInfo>? children})
      : super(MatchesRouter.name, path: 'matches', initialChildren: children);

  static const String name = 'MatchesRouter';
}

/// generated route for
/// [_i3.FavouritesPage]
class FavouritesRoute extends _i2.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: '');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i4.TeamPage]
class TeamRoute extends _i2.PageRouteInfo<TeamRouteArgs> {
  TeamRoute({_i9.Key? key, required String teamId})
      : super(TeamRoute.name,
            path: ':teamId',
            args: TeamRouteArgs(key: key, teamId: teamId),
            rawPathParams: {'teamId': teamId});

  static const String name = 'TeamRoute';
}

class TeamRouteArgs {
  const TeamRouteArgs({this.key, required this.teamId});

  final _i9.Key? key;

  final String teamId;

  @override
  String toString() {
    return 'TeamRouteArgs{key: $key, teamId: $teamId}';
  }
}

/// generated route for
/// [_i5.LeaguePage]
class LeagueRoute extends _i2.PageRouteInfo<LeagueRouteArgs> {
  LeagueRoute({_i9.Key? key, required String leagueId})
      : super(LeagueRoute.name,
            path: ':leagueId',
            args: LeagueRouteArgs(key: key, leagueId: leagueId),
            rawPathParams: {'leagueId': leagueId});

  static const String name = 'LeagueRoute';
}

class LeagueRouteArgs {
  const LeagueRouteArgs({this.key, required this.leagueId});

  final _i9.Key? key;

  final String leagueId;

  @override
  String toString() {
    return 'LeagueRouteArgs{key: $key, leagueId: $leagueId}';
  }
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i2.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.MatchesPage]
class MatchesRoute extends _i2.PageRouteInfo<void> {
  const MatchesRoute() : super(MatchesRoute.name, path: '');

  static const String name = 'MatchesRoute';
}

/// generated route for
/// [_i8.MatchPage]
class MatchRoute extends _i2.PageRouteInfo<MatchRouteArgs> {
  MatchRoute({_i9.Key? key, required String matchId})
      : super(MatchRoute.name,
            path: ':matchId',
            args: MatchRouteArgs(key: key, matchId: matchId),
            rawPathParams: {'matchId': matchId});

  static const String name = 'MatchRoute';
}

class MatchRouteArgs {
  const MatchRouteArgs({this.key, required this.matchId});

  final _i9.Key? key;

  final String matchId;

  @override
  String toString() {
    return 'MatchRouteArgs{key: $key, matchId: $matchId}';
  }
}
