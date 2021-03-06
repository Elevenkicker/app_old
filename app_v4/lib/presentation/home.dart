import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'routes/routes.gr.dart';
import 'widgets/custom_app_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        appBarBuilder: (context, tabsRouter) => AppBar(
              // leading: const AutoBackButton(),
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
        bottomNavigationBuilder: (context, tabsRouter) {
          return Stack(
            children: [
              BottomNavigationBar(
                elevation: 10,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
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
          );
        });
  }
}
