import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/screens/daily_reward/daily_reward_screen.dart';
import 'package:tiger_fortune_app/screens/home/home_screen.dart';
import 'package:tiger_fortune_app/settings/settings_screen.dart';
import 'package:tiger_fortune_app/spots/spots_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DailyRewardRoute.page),
    AutoRoute(page: SpotsRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}