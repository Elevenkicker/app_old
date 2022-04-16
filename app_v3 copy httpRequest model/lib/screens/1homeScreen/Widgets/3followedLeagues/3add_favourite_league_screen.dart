import 'package:app_v3/provider/3league/leagues_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddFavouriteLeagueScreen extends StatefulWidget {
  const AddFavouriteLeagueScreen({Key? key}) : super(key: key);

  static const screenName = "/addFavouriteLeagueScreen";

  @override
  State<AddFavouriteLeagueScreen> createState() =>
      _AddFavouriteLeagueScreenState();
}

class _AddFavouriteLeagueScreenState extends State<AddFavouriteLeagueScreen> {
  @override
  Widget build(BuildContext context) {
    final leaguesData = Provider.of<LeaguesProvider>(context);
    final allLeagues = leaguesData.allLeagues;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: leaguesData.getAllLeagues(),
          builder: (context, snapshot) => ListView.separated(
            itemCount: allLeagues.length,
            separatorBuilder: (context, index) {
              return const Gap(10);
            },
            itemBuilder: (context, index) {
              return InkWell(
                  child: Container(
                    color: const Color.fromRGBO(25, 50, 125, 1),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/ligalogos/1.png",
                            // "assets/images/ligalogos/${leagues[index].id}.png",
                          ),
                          const Gap(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allLeagues[index].name!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                allLeagues[index].parentName!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    allLeagues[index].toggleFavouriteStatus();
                    leaguesData.updateFavouriteLeagues();
                    Navigator.of(context).pop();
                  });
            },
          ),
        ),
      ),
    );
  }
}
