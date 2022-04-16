import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/3league/leagues_provider.dart';
import '../../widgets/detail_screen_header.dart';

class LeagueScreen extends StatefulWidget {
  static const screenName = "/leagueScreen";

  const LeagueScreen({Key? key}) : super(key: key);
  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    final leagueId = ModalRoute.of(context)?.settings.arguments as int;
    final leaguesData = Provider.of<LeaguesProvider>(context);
    final league = Provider.of<LeaguesProvider>(context).findById(leagueId);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
        centerTitle: true,
        title: const Text("Elevenkicker",
            style: TextStyle(fontFamily: "LeagueGothic", fontSize: 45)),
      ),
      body: DetailScreenHeader(
        id: league.id! as int,
        name: league.name!,
        isFavourite: league.isFavourite!,
        toggleFavouriteStatus: league.toggleFavouriteStatus,
        updateFavourites: leaguesData.updateFavouriteLeagues,
        object: league,
      ),
    );
  }
}
