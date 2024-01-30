import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/theme/colors.dart';

class StrokeTitleWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const StrokeTitleWidget({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = AppColors.yellow,
          ),
        ),
        // Solid text as fill.
        Text(
          text.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            color: AppColors.titlered,
          ),
        ),
      ],
    );
  }
}
