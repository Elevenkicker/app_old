import 'package:flutter/material.dart';

import '1presentation/screens/router.dart';

void main() {
  runApp(ElevenkickerApp(
    router: AppRouter(),
  ));
}

class ElevenkickerApp extends StatelessWidget {
  const ElevenkickerApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  final AppRouter? router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router?.generateRoute,
    );
  }
}
