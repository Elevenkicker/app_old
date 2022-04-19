import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/1player/players_provider.dart';
import 'provider/2team/teams_provider.dart';
import 'provider/3league/leagues_provider.dart';
import 'screens/1homeScreen/Widgets/1followedPlayers/3add_favourite_player_screen.dart';
import 'screens/1homeScreen/Widgets/2followedTeams/3add_favourite_team_screen.dart';
import 'screens/1homeScreen/Widgets/3followedLeagues/3add_favourite_league_screen.dart';
import 'home.dart';
import 'screens/1homeScreen/home_screen.dart';
import 'screens/4teamScreen/team_screen.dart';
import 'screens/6teamManagerScreen/team_manager_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const pageName = "/";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayerProvider()),
        ChangeNotifierProvider(create: (context) => PlayersProvider()),
        ChangeNotifierProvider(create: (context) => TeamProvider()),
        ChangeNotifierProvider(create: (context) => TeamsProvider()),
        ChangeNotifierProvider(create: (context) => LeagueProvider()),
        ChangeNotifierProvider(create: (context) => LeaguesProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.screenName: (context) => const HomeScreen(),
            AddFavouritePlayerScreen.screenName: (context) =>
                const AddFavouritePlayerScreen(),
            AddFavouriteTeamScreen.screenName: (context) =>
                const AddFavouriteTeamScreen(),
            AddFavouriteLeagueScreen.screenName: (context) =>
                const AddFavouriteLeagueScreen(),
            TeamScreen.screenName: (context) => const TeamScreen(),
            TeamManagerScreen.screenName: (context) =>
                const TeamManagerScreen(),
          },
          home: const Home()),
    );
  }
}
