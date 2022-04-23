import 'package:auto_route/auto_route.dart';
import '../home.dart';
import '../screens/favouritesPage/favourites_page.dart';
import '../screens/leaguePage/league_page.dart';
import '../screens/matchPage/match_page.dart';
import '../screens/matchesPage/matches_page.dart';
import '../screens/searchPage/search_page.dart';
import '../screens/teamPage/team_page.dart';

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
class $AppRouter {


  Route generateRoute






}
