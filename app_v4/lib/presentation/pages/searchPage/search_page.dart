import 'package:app_v4/cubit/searchCubit/search_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../routes/routes.gr.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCubit>(context).fetchData();
    final _controller = PageController(initialPage: 0);
    int selectedRegion = 0;
    int selectedLeague = 0;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Scaffold(
              backgroundColor: Color.fromRGBO(16, 38, 102, 1),
              body: Center(child: CircularProgressIndicator()));
        } else if (state is SearchLoaded) {
          final regionsList = state.regionsList;
          int leagueListLength = 0;
          return Scaffold(
            backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
            body: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Region List
                ListView.separated(
                    itemCount: regionsList.length,
                    separatorBuilder: (context, i) => const Gap(5),
                    itemBuilder: (context, i) {
                      return ListTile(
                          textColor: Colors.white,
                          tileColor: const Color.fromRGBO(25, 50, 125, 1),
                          title: Text(regionsList[i].regionName),
                          subtitle: const Text('Aktiv'),
                          onTap: () {
                            selectedRegion = i;
                            leagueListLength = regionsList[selectedRegion]
                                .regionLeagues
                                .length;
                            print('Region $leagueListLength');
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeInOut);
                          });
                    }),
                // League List
                ListView.separated(
                    itemCount: regionsList[selectedRegion].regionLeagues.length,
                    separatorBuilder: (context, i) => const Gap(5),
                    itemBuilder: (context, i) {
                      print(
                          'League ${regionsList[selectedRegion].regionLeagues.length}');
                      return ListTile(
                          leading: Image.asset("assets/images/ligalogos/1.png"),
                          textColor: Colors.white,
                          tileColor: const Color.fromRGBO(25, 50, 125, 1),
                          title: Text(regionsList[selectedRegion]
                              .regionLeagues[i]
                              .leagueName!),
                          subtitle: Text(regionsList[selectedRegion]
                              .regionLeagues[i]
                              .regionName),
                          onTap: () {
                            selectedLeague = i;
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeInOut);
                          });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white),
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut);
                        print(regionsList[selectedRegion]
                            .regionLeagues[1]
                            .leagueTeams[selectedLeague]);
                      },
                    ),
                    Expanded(
                      // Team List
                      child: ListView.separated(
                          itemCount: regionsList[selectedRegion]
                              .regionLeagues[selectedLeague]
                              .leagueTeams
                              .length,
                          separatorBuilder: (context, i) => const Gap(5),
                          itemBuilder: (context, i) {
                            print({
                              regionsList[selectedRegion]
                                  .regionLeagues[selectedLeague]
                                  .leagueTeams[i]
                                  .teamName2
                            });
                            return ListTile(
                                leading: Image.asset(
                                    "assets/images/vereinslogos/${regionsList[selectedRegion].regionLeagues[i].leagueTeams[selectedLeague].leagueId}/${regionsList[selectedRegion].regionLeagues[i].leagueTeams[selectedLeague].teamName1}.png"),
                                textColor: Colors.white,
                                tileColor: const Color.fromRGBO(25, 50, 125, 1),
                                title: Text(
                                    '${regionsList[selectedRegion].regionLeagues[selectedLeague].leagueTeams[i].teamName2}'),
                                subtitle: Text(regionsList[selectedRegion]
                                    .regionLeagues[i]
                                    .regionName),
                                onTap: () {
                                  context.router.push(TeamRoute(
                                      teamId: regionsList[selectedRegion]
                                          .regionLeagues[i]
                                          .leagueTeams[selectedLeague]
                                          .teamId!));
                                });
                          }),
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
