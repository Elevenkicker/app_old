import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'provider/1player/players_provider.dart';
import 'provider/2team/teams_provider.dart';
import 'provider/3league/leagues_provider.dart';
import 'screens/1homeScreen/Widgets/1followedPlayers/3add_favourite_player_screen.dart';
import 'screens/1homeScreen/Widgets/2followedTeams/3add_favourite_team_screen.dart';
import 'screens/1homeScreen/Widgets/3followedLeagues/3add_favourite_league_screen.dart';
import 'screens/1homeScreen/home_screen.dart';
import 'screens/2gamesScreen/games_screen.dart';
import 'screens/3searchScreen/search_screen.dart';
import 'screens/4teamScreen/team_screen.dart';
import 'screens/teamManagerScreen/team_manager_screen.dart';

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
          TeamManagerScreen.screenName: (context) => const TeamManagerScreen(),
        },
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            centerTitle: true,
            title: const Text("Elevenkicker",
                style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
          ),
          drawer: Drawer(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            child: Column(
              children: [
                const Gap(50),
                Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: const Center(
                      child: Text("Menü",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                    )),
                const Gap(10),
                Container(height: 0.5, color: Colors.white),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: double.infinity, height: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(25, 50, 125, 1),
                          ),
                          child: const Text("Player Management",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {},
                        ),
                      ),
                      const Gap(15),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: double.infinity, height: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(25, 50, 125, 1),
                          ),
                          child: const Text("Team Management",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {},
                        ),
                      ),
                      const Gap(30),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: double.infinity, height: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(25, 50, 125, 0.5),
                            elevation: 0,
                          ),
                          child: const Text("About us",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
