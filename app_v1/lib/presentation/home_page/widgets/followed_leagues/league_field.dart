import 'package:flutter/material.dart';

class LeagueField extends StatelessWidget {
  const LeagueField({
    Key? key,
    required this.playerName,
    required this.playerTeamName,
  }) : super(key: key);

  final String playerName;
  final String playerTeamName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Image.asset("assets/images/player_placeholder_image.png"),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(playerName,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              Text(playerTeamName,
                  style: const TextStyle(color: Colors.white, fontSize: 8))
            ],
          )
        ],
      ),
    );
  }
}
