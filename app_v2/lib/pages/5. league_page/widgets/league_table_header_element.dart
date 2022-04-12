import 'package:flutter/material.dart';

class leagueTableHeaderElement extends StatelessWidget {
  const leagueTableHeaderElement({
    Key? key,
    required this.title,
    required this.width,
  }) : super(key: key);

  final String title;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
