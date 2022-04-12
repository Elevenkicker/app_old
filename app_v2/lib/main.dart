import 'package:app_v2/pages/1.%20home_page/widgets/3.%20followed_leagues/add_favourite_league.dart';
import 'package:app_v2/pages/2.%20search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'pages/1. home_page/home_page.dart';
import 'pages/3. games_page/games_page.dart';
import 'pages/4. team_page/team_page.dart';
import 'pages/5. league_page/league_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyApp.pageName,
      routes: {
        HomePage.pageName: (context) => const HomePage(),
        TeamPage.pageName: (context) => const TeamPage(),
        LeaguePage.pageName: (context) => const LeaguePage(),
        AddFavouriteLeague.pageName: (context) => const AddFavouriteLeague(),
        // "/searchPage": (context) => const HomePage(),
        // "/gamesPage": (context) => const HomePage(),
      },
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const pageName = "/";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _pages = [
    const HomePage(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Elevenkicker",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
