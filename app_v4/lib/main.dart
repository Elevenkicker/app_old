import 'package:app_v4/cubit/teamCubit/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/searchCubit/search_cubit.dart';
import 'presentation/routes/routes.gr.dart';

void main() {
  runApp(const ElevenkickerApp());
}

class ElevenkickerApp extends StatelessWidget {
  const ElevenkickerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => TeamCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Elevenkicker App',
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
