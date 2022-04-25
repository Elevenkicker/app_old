import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:app_v4/data/models/player.dart';

class PlayerFieldItem extends StatelessWidget {
  const PlayerFieldItem({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
        width: 3,
        color: Color.fromRGBO(35, 60, 128, 1),
      ))),
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Image.asset("assets/images/player_placeholder_image.png"),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(player.playerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Elenvenkicker",
                      fontWeight: FontWeight.w400,
                    )),
                const Gap(1),
                Text(player.teamName2,
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
    );
  }
}
