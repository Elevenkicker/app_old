import 'package:app_v4/1presentation/screens/1homeScreen/home_screen.dart';
import 'package:app_v4/1presentation/screens/2searchScreen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../2cubit/game_cubit.dart';
import '../../2cubit/home_cubit.dart';
import '../../2cubit/search_cubit.dart';
import '3matchesScreen/matches_screen.dart';

class AppRouter {
  // Repository? repository;

  HomeCubit? homeCubit;

  AppRouter() {
    // required this.repository,
    homeCubit = HomeCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: HomeCubit(),
            child: const HomeScreen(),
          ),
        );

      case '/searchScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchScreen(),
          ),
        );

      case '/gamesScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GameCubit(),
            child: const MatchesScreen(),
          ),
        );

      default:
    }
    return null;
  }
}
