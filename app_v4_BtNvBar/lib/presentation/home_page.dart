import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../routes/routes.gr.dart';
import 'widgets/custom_app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        appBarBuilder: (context, tabsRouter) => AppBar(
              leading: const AutoBackButton(),
              backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
              centerTitle: true,
              title: const Text(
                "Elevenkicker",
                style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45),
              ),
            ),
        drawer: const CustomAppDrawer(),
        routes: const [
          FavouritesRouter(),
          SearchRouter(),
          MatchesRouter(),
        ],
        bottomNavigationBuilder: (context, TabsRouter) {
          return Stack(
            children: [
              SalomonBottomBar(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                currentIndex: TabsRouter.activeIndex,
                onTap: TabsRouter.setActiveIndex,
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text('home'),
                    selectedColor: Colors.white,
                    unselectedColor: Colors.white54,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.search),
                    title: const Text('Search'),
                    selectedColor: Colors.white,
                    unselectedColor: Colors.white54,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.sports_soccer),
                    title: const Text('Matches'),
                    selectedColor: Colors.white,
                    unselectedColor: Colors.white54,
                  ),
                ],
              ),
              Container(height: 0.5, color: Colors.white),
            ],
          );
        });
  }
}
