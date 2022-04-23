import 'package:app_v4/presentation/home_page.dart';
import 'package:app_v4/presentation/screens/favouritesPage/favourites_page.dart';
import 'package:app_v4/presentation/screens/leaguePage/league_page.dart';
import 'package:app_v4/presentation/screens/matchPage/match_page.dart';
import 'package:app_v4/presentation/screens/matchesPage/matches_page.dart';
import 'package:app_v4/presentation/screens/searchPage/search_page.dart';
import 'package:app_v4/presentation/screens/teamPage/team_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'favourites',
          name: 'FavouritesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: FavouritesPage,
            ),
            AutoRoute(
              path: ':teamId',
              page: TeamPage,
            ),
            AutoRoute(
              path: ':leagueId',
              page: LeaguePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'search',
          name: 'SearchRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: SearchPage,
            ),
            AutoRoute(
              path: ':teamId',
              page: TeamPage,
            ),
            AutoRoute(
              path: ':leagueId',
              page: LeaguePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'matches',
          name: 'MatchesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: MatchesPage,
            ),
            AutoRoute(
              path: ':matchId',
              page: MatchPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
