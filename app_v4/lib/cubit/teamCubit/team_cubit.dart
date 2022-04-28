import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/team.dart';
import '../../data/repository.dart';
part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final Repository repository = Repository();

  TeamCubit() : super(TeamLoading());

  void fetchTeam(String teamId) async {
    emit(TeamLoading());
    Team team = await repository.fetchTeam(teamId);
    // League leagueofTeam = await repository.fetchTeamLeague(team.leagueId);
    Map<String, String> leagueTeamNames =
        await repository.getleagueTeamNames(team.leagueId);

    emit(TeamLoaded(
      team: team,
      // leagueOfTeam: leagueofTeam,
      leagueTeamNames: leagueTeamNames,
    ));
  }
}
