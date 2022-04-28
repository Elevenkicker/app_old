import 'package:app_v4/cubit/searchCubit/search_cubit.dart';
import 'package:app_v4/presentation/pages/searchPage/widgets/region_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/routes.gr.dart';
import 'widgets/league_list.dart';
import 'widgets/team_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).fetchData();
    super.initState();
  }

  final PageController _controller = PageController();

  int selectedRegion = 0;
  int selectedLeague = 0;

  void selectRegion(i) {
    setState(() {
      selectedRegion = i;
      _controller.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    });
  }

  void selectLeague(i) {
    setState(() {
      selectedLeague = i;
      _controller.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    });
  }

  openTeamPage(teamId) {
    setState(() {
      context.router.push(TeamRoute(teamId: teamId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Scaffold(
              backgroundColor: Color.fromRGBO(16, 38, 102, 1),
              body: Center(child: CircularProgressIndicator()));
        } else if (state is SearchLoaded) {
          final regionsList = state.regionsList;
          return Scaffold(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            body: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  child: RegionList(
                    regionsList: regionsList,
                    selectRegion: selectRegion,
                  ),
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      setState(() {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    }
                  },
                ),
                Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(16, 38, 102, 1),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded,
                                color: Colors.white),
                            onPressed: () {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut);
                            },
                          ),
                          Expanded(
                            child: ListTile(
                                textColor: Colors.white,
                                tileColor: const Color.fromRGBO(25, 50, 125, 1),
                                title: Text(
                                  regionsList[selectedRegion].regionName,
                                  style: const TextStyle(fontSize: 25),
                                ),
                                onTap: () {
                                  setState(() {
                                    _controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.easeInOut);
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: LeagueList(
                          leagueList: regionsList[selectedRegion].regionLeagues,
                          selectLeague: selectLeague,
                        ),
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity! > 0) {
                            setState(() {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            });
                          } else if (details.primaryVelocity! < 0) {
                            setState(() {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color.fromRGBO(16, 38, 102, 1),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded,
                                color: Colors.white),
                            onPressed: () {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut);
                            },
                          ),
                          Expanded(
                            child: ListTile(
                                // leading: Image.network(
                                //     'http://34.159.133.82:5000/get_league_logo?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy&leagueId=${regionsList[selectedRegion].regionLeagues[selectedLeague].leagueId!.toInt()}'),
                                textColor: Colors.white,
                                tileColor: const Color.fromRGBO(25, 50, 125, 1),
                                title: Text(regionsList[selectedRegion]
                                    .regionLeagues[selectedLeague]
                                    .leagueName!),
                                subtitle: Text(regionsList[selectedRegion]
                                    .regionLeagues[selectedLeague]
                                    .regionName),
                                onTap: () {
                                  setState(() {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.easeInOut);
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // Team List
                      child: GestureDetector(
                        child: TeamList(
                          teamList: regionsList[selectedRegion]
                              .regionLeagues[selectedLeague]
                              .leagueTeams,
                          openTeamPage: openTeamPage,
                        ),
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity! > 0) {
                            setState(() {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
