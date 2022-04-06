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
      decoration: const BoxDecoration(
        color: Color.fromRGBO(24, 45, 107, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 35)),
            const SizedBox(height: 10),
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
                  child: const Icon(Icons.add, color: Colors.white),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(31, 52, 112, 1)),
                    elevation: MaterialStateProperty.all(10),
                  ),
                  onPressed: null),
            ),
          ],
        ),
      ),
    );
  }
}
