import 'package:flutter/material.dart';

class LeagueTableBodyElement extends StatelessWidget {
  const LeagueTableBodyElement({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.width,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
