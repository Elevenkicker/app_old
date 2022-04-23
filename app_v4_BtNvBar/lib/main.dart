import 'package:app_v4/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp.router(
      title: 'Elevenkicker App',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
