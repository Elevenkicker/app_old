import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({
    Key? key,
    @PathParam() required this.leagueId,
  }) : super(key: key);

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'League Page',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
      ),
    );
  }
}
