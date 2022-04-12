import 'package:app_v2/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/3. league_model.dart';

class AddFavouriteLeague extends StatefulWidget {
  const AddFavouriteLeague({Key? key}) : super(key: key);

  static const pageName = "/addFavouriteLeague";

  @override
  State<AddFavouriteLeague> createState() => _AddFavouriteLeagueState();
}

class _AddFavouriteLeagueState extends State<AddFavouriteLeague> {
  List<LeagueModel> allNonFavouriteLeauges = DUMMY_LEAGUES;

  @override
  Widget build(BuildContext context) {
    final favouriteLeagues =
        ModalRoute.of(context)!.settings.arguments as List<LeagueModel>;

    for (var favouriteleague in favouriteLeagues) {
      allNonFavouriteLeauges
          .removeWhere((league) => league.leagueId == favouriteleague.leagueId);
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: DUMMY_LEAGUES.length,
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
                        "assets/images/ligalogos/${DUMMY_LEAGUES[index].leagueId}.png",
                      ),
                      const Gap(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DUMMY_LEAGUES[index].leagueName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            DUMMY_LEAGUES[index].leagueRegionName,
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
              onTap: () =>
                  Navigator.of(context).pop(DUMMY_LEAGUES[index].leagueId),
            );
          },
        ),
      ),
    );
  }
}
