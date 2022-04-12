import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/league_table.dart';
import 'widgets/leaguepage_header.dart';

class LeaguePage extends StatefulWidget {
  static const pageName = "/leaguePage";

  const LeaguePage({
    Key? key,
  }) : super(key: key);
  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  List<Widget> pages = [];

  final PageController _controller = PageController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final leagueId = routeArguments["leagueId"];
    final leagueName = routeArguments["leagueName"];
    final leagueRegionName = routeArguments["RegionLeagueName"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Fußball App",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          children: [
            LeaguePageHeader(leagueId: leagueId, leagueName: leagueName),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 87,
                    child: Text("Übersicht",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: pageIndex == 0 ? Colors.white : Colors.white54,
                          fontSize: 20,
                          fontFamily: "Elevenkicker",
                          fontWeight: pageIndex == 0
                              ? FontWeight.w500
                              : FontWeight.w200,
                        )),
                  ),
                  Expanded(
                    child: Text("Tabelle",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: pageIndex == 1 ? Colors.white : Colors.white54,
                          fontSize: 20,
                          fontFamily: "Elevenkicker",
                          fontWeight: pageIndex == 1
                              ? FontWeight.w500
                              : FontWeight.w200,
                        )),
                  ),
                  SizedBox(
                    width: 87,
                    child: Text("Spiele",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: pageIndex == 2 ? Colors.white : Colors.white54,
                          fontSize: 20,
                          fontFamily: "Elevenkicker",
                          fontWeight: pageIndex == 2
                              ? FontWeight.w500
                              : FontWeight.w200,
                        )),
                  ),
                ],
              ),
            ),
            const Gap(5),
            SmoothPageIndicator(
              count: 3,
              controller: _controller,
              effect: const SlideEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
                offset: 10,
                dotWidth: 137,
                dotHeight: 3,
                radius: 0,
                spacing: 0,
              ),
            ),
            const Gap(10),
            Stack(
              children: [
                Positioned(
                  top: 15,
                  child: Container(
                    height: 0.3,
                    width: 1000,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 30,
                        child: Text(
                          "Pl.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                        child: Text("Team Name",
                            style: TextStyle(color: Colors.white)),
                      ),
                      Gap(5),
                      SizedBox(
                        width: 38,
                        child: Text("Spiele",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Gap(10),
                      SizedBox(
                        width: 42,
                        child: Text("Tore",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Gap(10),
                      SizedBox(
                        width: 27,
                        child: Text("Diff.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                      Gap(10),
                      SizedBox(
                        width: 44,
                        child: Text("Punkte",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(3),
            SizedBox(
              height: 400,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: [
                  LeagueTable(leagueId: leagueId),
                  LeagueTable(leagueId: leagueId),
                  LeagueTable(leagueId: leagueId),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
