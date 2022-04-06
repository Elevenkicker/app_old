import 'package:flutter/material.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text(
          "Elevenkicker",
          style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45),
        ),
      ),
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
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
