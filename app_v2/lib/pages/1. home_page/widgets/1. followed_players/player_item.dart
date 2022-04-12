import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    Key? key,
    required this.playerId,
    required this.playerName,
    required this.playerTeamName,
  }) : super(key: key);

  final int playerId;
  final String playerName;
  final String playerTeamName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromRGBO(35, 60, 128, 1),
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            const Gap(10),
            Image.asset("assets/images/player_placeholder_image.png"),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(playerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Elenvenkicker",
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                const Gap(1),
                Text(playerTeamName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Elenvenkicker",
                      fontWeight: FontWeight.w200,
                      fontSize: 10,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
