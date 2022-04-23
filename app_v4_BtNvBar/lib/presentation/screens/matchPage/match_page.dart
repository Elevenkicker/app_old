import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({
    Key? key,
    @PathParam() required this.matchId,
  }) : super(key: key);

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Match',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
      ),
    );
  }
}
