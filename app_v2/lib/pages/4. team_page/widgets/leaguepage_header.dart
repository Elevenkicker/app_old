import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LeaguePageHeader extends StatelessWidget {
  const LeaguePageHeader({
    Key? key,
    required this.leagueId,
    required this.leagueName,
  }) : super(key: key);

  final int leagueId;
  final String leagueName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(16, 38, 102, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: Image.asset("assets/images/ligalogos/$leagueId.png")),
            const Gap(10),
            Text(leagueName,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            const Gap(2),
          ],
        ),
      ),
    );
  }
}
