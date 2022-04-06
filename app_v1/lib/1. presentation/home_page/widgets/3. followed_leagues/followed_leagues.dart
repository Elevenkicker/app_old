import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'league_field.dart';

class FollowedLeagues extends StatelessWidget {
  const FollowedLeagues({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(16, 38, 102, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (BuildContext context, int index) =>
                  const LeagueField(
                      playerName: "Flavio Aliu", playerTeamName: "SC Freiburg"),
            ),
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
                  onPressed: null),
            ),
          ],
        ),
      ),
    );
  }
}
