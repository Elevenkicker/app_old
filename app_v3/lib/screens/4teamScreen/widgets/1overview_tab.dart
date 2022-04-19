import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../provider/2team/teams_provider.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab(
    this.teamId, {
    Key? key,
  }) : super(key: key);

  final int teamId;

  @override
  Widget build(BuildContext context) {
    final team = Provider.of<TeamsProvider>(context).findById(teamId);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Gap(20),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(25, 50, 125, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset("assets/images/teamFormcheck/3.png"),
          ),
        ],
      ),
    );
  }
}
