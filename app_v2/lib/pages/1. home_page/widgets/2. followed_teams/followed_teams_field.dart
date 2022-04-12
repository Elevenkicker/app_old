import 'package:app_v2/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'team_item.dart';

class FollowedTeams extends StatelessWidget {
  const FollowedTeams({
    Key? key,
  }) : super(key: key);

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
              itemCount: 2,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (BuildContext context, int index) => TeamField(
                  teamName: DUMMY_TEAMS[index].teamName,
                  teamLeagueName: DUMMY_TEAMS[index].leagueName,
                  teamId: DUMMY_TEAMS[index].teamId),
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
                    print("Add Team Button was pressed");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
