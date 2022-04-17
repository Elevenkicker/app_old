import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../provider/1player/players_provider.dart';

class AddFavouritePlayerScreen extends StatefulWidget {
  const AddFavouritePlayerScreen({
    Key? key,
  }) : super(key: key);

  static const screenName = "/addFavouritePlayerScreen";

  @override
  State<AddFavouritePlayerScreen> createState() =>
      _AddFavouritePlayerScreenState();
}

class _AddFavouritePlayerScreenState extends State<AddFavouritePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final playersData = Provider.of<PlayersProvider>(context);
    final nonFavouritePlayers = playersData.nonFavouritePlayers;
    print(nonFavouritePlayers[0].name);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: nonFavouritePlayers.length,
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
                        "assets/images/player_placeholder_image.png",
                      ),
                      const Gap(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nonFavouritePlayers[index].name!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            nonFavouritePlayers[index].parentName!,
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
                nonFavouritePlayers[index].toggleFavouriteStatus();
                playersData.updateFavouritePlayers();
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
