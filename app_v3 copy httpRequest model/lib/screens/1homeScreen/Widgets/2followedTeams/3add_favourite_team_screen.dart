import 'package:app_v3/provider/2team/teams_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddFavouriteTeamScreen extends StatefulWidget {
  const AddFavouriteTeamScreen({
    Key? key,
  }) : super(key: key);

  static const screenName = "/addFavouriteTeamScreen";

  @override
  State<AddFavouriteTeamScreen> createState() => _AddFavouriteTeamScreenState();
}

class _AddFavouriteTeamScreenState extends State<AddFavouriteTeamScreen> {
  @override
  Widget build(BuildContext context) {
    final teamsData = Provider.of<TeamsProvider>(context);
    final nonFavouriteTeams = teamsData.nonFavouriteTeams;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: nonFavouriteTeams.length,
          separatorBuilder: (context, index) {
            return const Gap(10);
          },
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                color: const Color.fromRGBO(25, 50, 125, 1),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/vereinslogos/${nonFavouriteTeams[index].id}.png",
                      ),
                      const Gap(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nonFavouriteTeams[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            nonFavouriteTeams[index].parentName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                nonFavouriteTeams[index].toggleFavouriteStatus();
                teamsData.updateFavouriteTeams();
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
