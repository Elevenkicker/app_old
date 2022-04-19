import 'package:flutter/material.dart';

import 'screens/2gamesScreen/games_screen.dart';
import 'screens/3searchScreen/search_screen.dart';
import 'screens/7appDrawer/custom_app_drawer.dart';
import 'screens/1homeScreen/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Elevenkicker",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      drawer: const CustomAppDrawer(),
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
          Container(height: 0.5, color: Colors.white),
        ],
      ),
    );
  }
}
