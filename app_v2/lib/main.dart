import 'package:flutter/material.dart';
import 'pages/1. home_page/home_page.dart';
import 'pages/4. team_page/team_page.dart';
import 'pages/5. league_page/league_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomePage.pageName,
    routes: {
      HomePage.pageName: (context) => const HomePage(),
      TeamPage.pageName: (context) => const TeamPage(),
      LeaguePage.pageName: (context) => const LeaguePage(),
      // "/searchPage": (context) => const HomePage(),
      // "/gamesPage": (context) => const HomePage(),
    },
  ));
}
