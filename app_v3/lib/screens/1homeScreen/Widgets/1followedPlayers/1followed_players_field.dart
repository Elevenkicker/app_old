import 'package:app_v3/provider/1player/players_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '2followed_player_item.dart';
import '3add_favourite_player_screen.dart';

class FollowedPlayersField extends StatefulWidget {
  const FollowedPlayersField({Key? key}) : super(key: key);

  @override
  State<FollowedPlayersField> createState() => _FollowedPlayersFieldState();
}

class _FollowedPlayersFieldState extends State<FollowedPlayersField> {
  void openAddFavouritePlayerScreen(context) {
    Navigator.of(context).pushNamed(AddFavouritePlayerScreen.screenName);
  }

  @override
  Widget build(BuildContext context) {
    final playersData = Provider.of<PlayersProvider>(context);
    final favouritePlayers = playersData.favouritePlayers;

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
            const Text("Players",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favouritePlayers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: favouritePlayers[i],
                child: const FollowedPlayerItem(),
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
                onPressed: () => openAddFavouritePlayerScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
