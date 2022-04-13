import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/2. team/teams_provider.dart';
import '2. team_item.dart';
import 'add_favourite_team.dart';

class FollowedTeamsField extends StatelessWidget {
  const FollowedTeamsField({Key? key}) : super(key: key);

  void openAddFavouritePage(context) {
    Navigator.of(context).pushNamed(AddFavouriteTeam.screenName);
  }

  @override
  Widget build(BuildContext context) {
    final teamsData = Provider.of<TeamsProvider>(context);
    final teams = teamsData.favouriteTeams;

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
            const Text("Teams",
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
              itemCount: teams.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: teams[i],
                child: const TeamItem(),
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
                  onPressed: () => openAddFavouritePage(context)),
            ),
          ],
        ),
      ),
    );
  }
}
