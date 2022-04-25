import 'package:auto_route/auto_route.dart';
import '../home.dart';
import '../pages/favouritesPage/favourites_page.dart';
import '../pages/leaguePage/league_page.dart';
import '../pages/matchPage/match_page.dart';
import '../pages/matchesPage/matches_page.dart';
import '../pages/searchPage/search_page.dart';
import '../pages/teamPage/team_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: Home,
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
class AppRouter {}
