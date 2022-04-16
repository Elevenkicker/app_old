import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../provider/2team/teams_provider.dart';
import '../../../4teamScreen/team_screen.dart';
import '2followed_team_item.dart';
import '3add_favourite_team_screen.dart';

class FollowedTeamsField extends StatefulWidget {
  const FollowedTeamsField({Key? key}) : super(key: key);

  @override
  State<FollowedTeamsField> createState() => _FollowedTeamsFieldState();
}

class _FollowedTeamsFieldState extends State<FollowedTeamsField> {
  void openAddFavouriteTeamScreen(context) {
    Navigator.of(context).pushNamed(AddFavouriteTeamScreen.screenName);
  }

  void openTeamScreen(team) {
    Navigator.of(context).pushNamed(TeamScreen.screenName, arguments: team.id!);
  }

  @override
  Widget build(BuildContext context) {
    final teamsData = Provider.of<TeamsProvider>(context);
    final favouriteTeams = teamsData.favouriteTeams;

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
              itemCount: favouriteTeams.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: favouriteTeams[i],
                child: FollowedTeamItem(openTeamScreen: openTeamScreen),
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
                onPressed: () => openAddFavouriteTeamScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
