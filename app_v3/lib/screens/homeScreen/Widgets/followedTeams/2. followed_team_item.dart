import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../provider/team/team_provider.dart';

class FollowedTeamItem extends StatelessWidget {
  const FollowedTeamItem({
    Key? key,
    required this.openTeamScreen,
  }) : super(key: key);

  final Function openTeamScreen;

  @override
  Widget build(BuildContext context) {
    final team = Provider.of<TeamProvider>(context);
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.only(left: 10)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(35, 60, 128, 1)),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Image.asset("assets/images/vereinslogos/${team.teamId}.png"),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(team.teamName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Elenvenkicker",
                          fontWeight: FontWeight.w400,
                        )),
                    const Gap(1),
                    Text(team.leagueName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: "Elenvenkicker",
                          fontWeight: FontWeight.w200,
                        ))
                  ],
                )
              ],
            ),
          ),
          onPressed: () => openTeamScreen(team)),
    );
  }
}
