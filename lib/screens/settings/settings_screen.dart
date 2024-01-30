import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiger_fortune_app/router/router.dart';
import 'package:tiger_fortune_app/theme/colors.dart';
import 'package:tiger_fortune_app/widgets/action_button_widget.dart';
import 'package:tiger_fortune_app/widgets/stroke_title_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgred,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                    onTap: () {
                      context.router.popAndPush(HomeRoute());
                    },
                    child: SvgPicture.asset(
                        'assets/images/elements/arrow-left.svg')),
              ),
              StrokeTitleWidget(text: 'Settings', fontSize: 32),
              SizedBox(
                width: 60,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ActionButtonWidget(
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'Share with friends',
                    width: 240,
                    height: 55,
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ActionButtonWidget(
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'Privacy Policy',
                    width: 240,
                    height: 55,
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ActionButtonWidget(
                    color: AppColors.red,
                    strokeColor: AppColors.darkred,
                    text: 'Terms of use',
                    width: 240,
                    height: 55,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Vibro', style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),),
                      SizedBox(width: 100),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppColors.red,
                      ),
                    ],
                  ),
                  Text('App icon', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.white,
                  ),),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/settings/1.png', width: 55),
                          SizedBox(width: 15),
                          Image.asset('assets/images/settings/2.png', width: 55),
                          SizedBox(width: 15),
                          Image.asset('assets/images/settings/3.png', width: 55),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset('assets/images/settings/4.png', width: 55),
                          SizedBox(width: 15),
                          Image.asset('assets/images/settings/5.png', width: 55),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),),
    );
  }
}
