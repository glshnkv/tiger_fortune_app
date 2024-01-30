import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiger_fortune_app/router/router.dart';
import 'package:tiger_fortune_app/screens/win/win_screen.dart';
import 'package:tiger_fortune_app/service/shared_preferences.dart';
import 'package:tiger_fortune_app/theme/colors.dart';
import 'package:tiger_fortune_app/widgets/action_button_widget.dart';

@RoutePage()
class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  StreamController<int> controller = StreamController<int>();

  @override
  void initState() {
    getBalance();
    super.initState();
  }

  int balance = 0;
  int bet = 0;
  int win = 0;

  final items = <String>[
    'assets/images/games-elements/2.png',
    '100',
    'assets/images/games-elements/1.png',
    '50',
    'assets/images/games-elements/2.png',
    '0',
    'assets/images/games-elements/3.png',
    '20',
    'assets/images/games-elements/4.png',
    '0',
    '100000',
    '20',
    'assets/images/games-elements/1.png',
    '0',
  ];

  void getBalance() async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    setState(() {
      balance = storage.coins;
    });
  }

  void increment() {
    setState(() {
      if (balance > 40) {
        balance -= 40;
        bet += 40;
      }
    });
  }

  void decrement() {
    setState(() {
      if (bet > 0) {
        balance += 40;
        bet -= 40;
      }
    });
  }

  void onSpinEnd(int result) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    switch (result) {
      case 0:
        storage.coins += bet * 20;
        win = bet * 20;
      case 1:
        storage.coins += bet + 100;
        win = 100;
      case 2:
        storage.coins += bet * 10;
        win = bet * 10;
      case 3:
        storage.coins += bet + 50;
        win = 50;
      case 4:
        storage.coins += bet * 20;
        win = bet * 20;
      case 5:
        storage.coins += bet + 0;
        win = 0;
      case 6:
        storage.coins += bet * 15;
        win = bet * 15;
      case 7:
        storage.coins += bet + 20;
        win = 20;
      case 8:
        storage.coins += bet * 5;
        win = bet * 5;
      case 9:
        storage.coins += bet + 0;
        win = 0;
      case 10:
        storage.coins += bet + 100000;
        win = 100000;
      case 11:
        storage.coins += bet + 20;
        win = 20;
      case 12:
        storage.coins += bet * 10;
        win = bet * 10;
      case 13:
        storage.coins += bet + 0;
        win = 0;
    }
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/roulette/bg-roulette.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 330,
                      width: 175,
                      child: Stack(
                        children: [
                          Image.asset(
                              'assets/images/games-elements/column.png'),
                          Align(
                            alignment: Alignment(0, -0.57),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'BET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColors.blue,
                                  ),
                                ),
                                Text(
                                  '${bet}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/images/roulette/circal-bg.svg'),
                        Container(
                          height: 275,
                          width: 275,
                          child: FortuneWheel(
                            physics: NoPanPhysics(),
                            animateFirst: false,
                            selected: controller.stream,
                            items: [
                              for (var i in items)
                                i.length < 10
                                    ? FortuneItem(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 80),
                                            Text(
                                              i,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        style: FortuneItemStyle(
                                          color: AppColors.itemyellow,
                                          borderColor: AppColors.borderyellow,
                                          borderWidth: 5,
                                        ),
                                      )
                                    : FortuneItem(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 80),
                                            Image.asset(
                                              i,
                                              width: 35,
                                            ),
                                          ],
                                        ),
                                        style: FortuneItemStyle(
                                          color: AppColors.itemyellow,
                                          borderColor: AppColors.borderyellow,
                                          borderWidth: 5,
                                        ),
                                      ),
                            ],
                            indicators: <FortuneIndicator>[
                              FortuneIndicator(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    'assets/images/roulette/indicator.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 175,
                          child: Stack(
                            children: [
                              Image.asset(
                                  'assets/images/games-elements/balance.png'),
                              Align(
                                alignment: Alignment(0, 0.3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'BALANCE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Text(
                                      '${balance}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                decrement();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/games-elements/minus.svg'),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                increment();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/games-elements/plus.svg'),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ActionButtonWidget(
                          color: AppColors.blue,
                          strokeColor: AppColors.darkblue,
                          text: 'SPIN',
                          width: 140,
                          height: 55,
                          onTap: () async {
                            SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                            if (storage.coins > 40) {
                              balance -= 40;
                              storage.coins -= 40;
                              setState(() {
                                final int result =
                                    Fortune.randomInt(0, items.length);
                                print(result);
                                controller.add(result);
                                onSpinEnd(result);
                                Future.delayed(const Duration(seconds: 6), () {
                                  bet = 0;
                                  context.router.push(WinRoute(type: GameType.roulette, winAmount: win));
                                });
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.darkred,
                                  content: Text(
                                    'Not enough Coins... Try later',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                      onTap: () {
                        context.router
                            .popAndPush(MenuRoute(type: GameType.roulette));
                      },
                      child:
                          SvgPicture.asset('assets/images/elements/menu.svg')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
