import 'package:flutter/material.dart';

import 'router/router.dart';

class TigerFortuneApp extends StatelessWidget {
  TigerFortuneApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );  }
}
