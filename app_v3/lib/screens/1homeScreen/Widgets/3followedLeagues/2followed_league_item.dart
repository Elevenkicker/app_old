import 'package:app_v3/provider/3league/leagues_provider.dart';
import 'package:app_v3/screens/5leagueScreen/league_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:provider/provider.dart';

class FollowedLeagueItem extends StatelessWidget {
  const FollowedLeagueItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final league = Provider.of<LeagueProvider>(context);
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.only(left: 10)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(35, 60, 128, 1)),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Image.asset("assets/images/ligalogos/${league.id}.png"),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(league.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Elenvenkicker",
                          fontWeight: FontWeight.w400,
                        )),
                    const Gap(1),
                    Text(league.parentName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: "Elenvenkicker",
                          fontWeight: FontWeight.w200,
                        ))
                  ],
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(LeagueScreen.screenName, arguments: league.id);
          }),
    );
  }
}
