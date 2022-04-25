import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(16, 38, 102, 1),
      body: Text(
        'Matches Page',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
      ),
    );
  }
}
