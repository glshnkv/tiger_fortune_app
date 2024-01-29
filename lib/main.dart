import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_fortune_app/screens/daily_reward/bloc/daily_reward_bloc.dart';
import 'package:tiger_fortune_app/tiger_fortune_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DailyRewardBloc>(
          create: (context) => DailyRewardBloc()),
      ],
    child: TigerFortuneApp(),
  ));
}
