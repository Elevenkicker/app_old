import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/team/teams_provider.dart';
import 'screens/gamesScreen/games_screen.dart';
import 'screens/homeScreen/Widgets/followedLeagues/add_favourite_league.dart';
import 'screens/homeScreen/Widgets/followedTeams/add_favourite_team.dart';
import 'screens/homeScreen/home_screen.dart';
import 'screens/searchScreen/search_screen.dart';
import 'screens/teamScreen/team_screen.dart';

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
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchPage(),
    const GamesPage(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.screenName: (context) => const HomeScreen(),
          AddFavouriteTeam.screenName: (context) => const AddFavouriteTeam(),
          AddFavouriteLeague.screenName: (context) =>
              const AddFavouriteLeague(),
          TeamScreen.screenName: (context) => const TeamScreen(),
        },
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            centerTitle: true,
            title: const Text("Elevenkicker",
                style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
          ),
          body: _pages[_selectedPageIndex],
          bottomNavigationBar: Stack(
            children: [
              BottomNavigationBar(
                elevation: 10,
                currentIndex: _selectedPageIndex,
                onTap: _selectPage,
                backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white54,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_soccer_rounded),
                    label: "Games",
                  ),
                ],
              ),
              Container(
                height: 0.5,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
