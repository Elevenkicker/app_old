import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../provider/3league/leagues_provider.dart';
import '../../../5leagueScreen/league_screen.dart';
import '2followed_league_item.dart';
import '3add_favourite_league_screen.dart';

class FollowedLeagueField extends StatefulWidget {
  const FollowedLeagueField({Key? key}) : super(key: key);

  @override
  State<FollowedLeagueField> createState() => _FollowedLeagueFieldState();
}

class _FollowedLeagueFieldState extends State<FollowedLeagueField> {
  void openAddFavouriteLeagueScreen(context) {
    Navigator.of(context).pushNamed(AddFavouriteLeagueScreen.screenName);
  }

  void openLeagueScreen(league) {
    Navigator.of(context)
        .pushNamed(LeagueScreen.screenName, arguments: league.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    final leaguesData = Provider.of<LeaguesProvider>(context);
    final favouriteLeagues = leaguesData.favouriteLeagues;

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
            const Text("Leagues",
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
              itemCount: favouriteLeagues.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: favouriteLeagues[i],
                child: const FollowedLeagueItem(),
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
                  onPressed: () => openAddFavouriteLeagueScreen(context)),
            ),
          ],
        ),
      ),
    );
  }
}
