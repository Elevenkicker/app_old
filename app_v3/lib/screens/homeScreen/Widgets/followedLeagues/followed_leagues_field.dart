import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'add_favourite_league.dart';

class FollowedLeagueField extends StatefulWidget {
  const FollowedLeagueField({Key? key}) : super(key: key);

  @override
  State<FollowedLeagueField> createState() => _FollowedLeagueFieldState();
}

class _FollowedLeagueFieldState extends State<FollowedLeagueField> {
  void openAddFavouritePage(context) {
    Navigator.of(context)
        .pushNamed(AddFavouriteLeague.screenName)
        .then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final leaguesData = Provider.of<LeaguesProvider>(context);
    // final leagues = leaguesData.favouriteLeagues;

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
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: leagues.length,
            //   separatorBuilder: (BuildContext context, int index) =>
            //       const Gap(10),
            //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            //     value: leagues[i],
            //     child: const FollowedLeagueItem(),
            //   ),
            // ),
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
                  onPressed: () => openAddFavouritePage(context)),
            ),
          ],
        ),
      ),
    );
  }
}
