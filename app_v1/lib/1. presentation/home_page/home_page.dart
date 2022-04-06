import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../models/league_model.dart';
import '../../models/team_model.dart';
import 'widgets/1. followed_players/followed_players.dart';
import 'widgets/2. followed_teams/followed_teams.dart';
import 'widgets/3. followed_leagues/followed_leagues.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final homePageBloc = HomepageBloc();

  // void addFavouritePlayerEvent() {
  //   homePageBloc.add(AddFavouritePlayerEvent());
  // }

  // void addFavouriteTeamEvent() {
  //   homePageBloc.add(AddFavouriteTeamEvent());
  // }

  // void addFavouriteLeagueEvent() {
  //   homePageBloc.add(AddFavouriteLeagueEvent());
  // }

  final List<TeamModel> favouriteTeams = [];
  final List<LeagueModel> favouriteLeagues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 52, 112, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(20),
                FollowedPlayers(
                  title: "Abonnierte Spieler",
                ),
                const Gap(20),
                const FollowedTeams(
                  title: "Teams",
                  // addFavouriteTeamEvent: addFavouriteTeamEvent,
                  // favouriteTeams: favouriteTeams),
                ),
                const Gap(20),
                const FollowedLeagues(
                  title: "Ligen",
                  // addFavouriteLeagueEvent: addFavouriteLeagueEvent,
                  // favouriteLeagues: favouriteLeagues),
                ),
                const Gap(20),
              ],
            ),
          ),

          // BlocBuilder<HomepageBloc, HomepageState>(
          //     bloc: homePageBloc,
          //     builder: (BuildContext context, homePageState) {
          //       if (homePageState is HomepageInitial) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Column(
          //             children: [
          //               const Gap(20),
          //               FollowedPlayers(
          //                 title: "Abonnierte Spieler",
          //                 addFavouritePlayerEvent: addFavouritePlayerEvent,
          //                 favouritePlayers: favouritePlayers,
          //               ),
          //               const Gap(20),
          //               FollowedTeams(
          //                 title: "Teams",
          //                 addFavouriteTeamEvent: addFavouriteTeamEvent,
          //                 favouriteTeams: favouriteTeams,
          //               ),
          //               const Gap(20),
          //               FollowedLeagues(
          //                 title: "Ligen",
          //                 addFavouriteLeagueEvent: addFavouriteLeagueEvent,
          //                 favouriteLeagues: favouriteLeagues,
          //               ),
          //               const Gap(20),
          //             ],
          //           ),
          //         );
          //       } else if (homePageState is LoadingPlayerSearch || homePageState is LoadingTeamSearch || homePageState is LoadingLeagueSearch) {
          //         return const CircularProgressIndicator();
          //       } else if (homePageState is BackToHomePageWithAddedPlayer) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Column(
          //             children: [
          //               const Gap(20),
          //               FollowedPlayers(
          //                 title: "Abonnierte Spieler",
          //                 addFavouritePlayerEvent: addFavouritePlayerEvent,
          //                 favouritePlayers: homePageState.favouritPlayers,
          //               ),
          //               const Gap(20),
          //               FollowedTeams(
          //                   title: "Teams",
          //                   addFavouriteTeamEvent: addFavouriteTeamEvent,
          //                   favouriteTeams: favouriteTeams),
          //               const Gap(20),
          //               FollowedLeagues(
          //                   title: "Ligen",
          //                   addFavouriteLeagueEvent: addFavouriteLeagueEvent,
          //                   favouriteLeagues: favouriteLeagues),
          //               const Gap(20),
          //             ],
          //           ),
          //         );
          //       } else if (homePageState is HomepageError) {
          //         return const Text(
          //           "Error",
          //           style: TextStyle(color: Colors.white),
          //         );
          //       } else {
          //         return const Text(
          //           "Unexpected Error",
          //           style: TextStyle(color: Colors.white),
          //         );
          //       }
          //     }),
        ),
      ),
    );
  }
}
