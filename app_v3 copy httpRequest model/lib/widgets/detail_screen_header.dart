import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../provider/2team/teams_provider.dart';
import '../provider/3league/leagues_provider.dart';

class DetailScreenHeader extends StatelessWidget {
  const DetailScreenHeader({
    Key? key,
    required this.id,
    required this.name,
    required this.isFavourite,
    required this.toggleFavouriteStatus,
    required this.updateFavourites,
    required this.object,
  }) : super(key: key);

  final int id;
  final String name;
  final bool isFavourite;
  final Function toggleFavouriteStatus;
  final Function updateFavourites;
  final Object object;

  Widget DisplayLogo(object) {
    if (object.runtimeType == TeamProvider) {
      return Image.asset("assets/images/vereinslogos/${object.id}.png");
    } else if (object.runtimeType == LeagueProvider) {
      return Image.asset("assets/images/ligalogos/${object.id}.png");
    } else {
      return const Text("No Image");
    }
  }

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
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: DisplayLogo(object),
                      ),
                      const Gap(10),
                      Text(name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    toggleFavouriteStatus();
                    updateFavourites();
                  },
                  child: SizedBox(
                    height: 27,
                    child: Image.asset(
                      isFavourite
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
