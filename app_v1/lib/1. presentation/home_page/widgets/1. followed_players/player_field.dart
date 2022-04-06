import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlayerField extends StatelessWidget {
  const PlayerField({
    Key? key,
    required this.playerName,
    required this.playerTeamName,
  }) : super(key: key);

  final String playerName;
  final String playerTeamName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 52, 114, 1),
        borderRadius: BorderRadius.circular(5),
      ),
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
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                Text(playerTeamName,
                    style: const TextStyle(color: Colors.white, fontSize: 8))
              ],
            )
          ],
        ),
      ),
    );
  }
}
