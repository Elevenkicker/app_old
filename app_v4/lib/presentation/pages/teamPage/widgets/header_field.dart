import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/team.dart';

class TeamDetailPageHeader extends StatelessWidget {
  const TeamDetailPageHeader({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(25, 50, 125, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Image.asset(
                            "assets/images/vereinslogos/${team.leagueId}/${team.teamName1}.png"),
                      ),
                      const Gap(10),
                      Text(
                        team.teamName2!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Column(
                        children: [
                          team.igUsername != ''
                              ? Text(
                                  "Instagram: ${team.igUsername}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                )
                              : const Gap(0),
                          const Gap(10),
                          team.fbUsername != ''
                              ? Text(
                                  team.fbUsername != null
                                      ? "Instagram: ${team.fbUsername}"
                                      : "",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                )
                              : const Gap(0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    if (team.isFavourite) {
                      showDialog(
                        context: context,
                        builder: (context2) => AlertDialog(
                          title: const Text("Bist du dir sicher?"),
                          content: Text(
                              "Möchtest du den $team.name wirklich deabonnieren?"),
                          actions: [
                            TextButton(
                                child: const Text("Ja"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // toggleFavouriteStatus();
                                  // updateFavourites();
                                }),
                            TextButton(
                                child: const Text("Nein"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ],
                        ),
                      );
                    } else {
                      // toggleFavouriteStatus();
                      // updateFavourites();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.green,
                            content:
                                Text("Du hast ${team.teamName2} abonniert"),
                            duration: const Duration(seconds: 3)),
                      );
                    }
                  },
                  child: SizedBox(
                    height: 25,
                    child: Image.asset(
                      team.isFavourite
                          ? "assets/images/abonnierenButton/abonniert.png"
                          : "assets/images/abonnierenButton/abonnieren.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
