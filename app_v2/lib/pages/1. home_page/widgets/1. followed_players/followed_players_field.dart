import 'package:app_v2/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'player_item.dart';

class FollowedPlayers extends StatelessWidget {
  const FollowedPlayers({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(16, 38, 102, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                )),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: DUMMY_PLAYERS.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (BuildContext context, int index) => PlayerItem(
                playerName: DUMMY_PLAYERS[index].playerName,
                playerTeamName: DUMMY_PLAYERS[index].playerTeamName,
                playerId: DUMMY_PLAYERS[index].playerId,
              ),
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(35, 60, 128, 1)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: () {
                    print("Add Player Button was pressed");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
