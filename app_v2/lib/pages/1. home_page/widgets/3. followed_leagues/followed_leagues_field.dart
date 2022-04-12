import 'package:app_v2/data.dart';
import 'package:app_v2/pages/1.%20home_page/widgets/3.%20followed_leagues/add_favourite_league.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../models/3. league_model.dart';
import 'league_field.dart';

class FollowedLeagues extends StatefulWidget {
  const FollowedLeagues({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowedLeagues> createState() => _FollowedLeaguesState();
}

class _FollowedLeaguesState extends State<FollowedLeagues> {
  void openAddFavouritePage(context) {
    Navigator.of(context)
        .pushNamed(AddFavouriteLeague.pageName, arguments: favouriteLeagues)
        .then((leagueId) {
      if (leagueId != null) {
        addLeagueToFavourites(leagueId);
      }
    });
  }

  List<LeagueModel> favouriteLeagues = [];

  void addLeagueToFavourites(leagueId) {
    setState(() {
      favouriteLeagues.add(DUMMY_LEAGUES.firstWhere((league) {
        return league.leagueId == leagueId;
      }));
    });
  }

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
            const Text("Ligen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Elenvenkicker",
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: favouriteLeagues.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(10),
                itemBuilder: (BuildContext context, int index) => LeagueField(
                      leagueName: favouriteLeagues[index].leagueName,
                      leagueRegionName:
                          favouriteLeagues[index].leagueRegionName,
                      leagueId: favouriteLeagues[index].leagueId,
                    )),
            const SizedBox(height: 10),
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
