import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../data/models/player.dart';
import 'player_field_item.dart';

class FollowedPlayersField extends StatelessWidget {
  FollowedPlayersField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  final List<Player> favouriteTeams = [
    Player(
        playerName: 'Andres Iniesta',
        teamId: '011MIANVN4000000VTVG0001VTR8C1K7',
        teamName2: 'SF Eintracht Freiburg'),
    Player(
        playerName: 'Xavi Hernandez',
        teamId: '011MIANVN4000000VTVG0001VTR8C1K7',
        teamName2: 'SV Solvay Freiburg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(25, 50, 125, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favouriteTeams.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) =>
                  PlayerFieldItem(player: favouriteTeams[i]),
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
                  onPressed: () {}
                  // => openAddFavouritePlayerScreen(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
