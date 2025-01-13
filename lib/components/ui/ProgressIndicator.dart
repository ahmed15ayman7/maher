import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final double percentage;

  ProgressIndicatorComponent({required this.percentage});

  Color _getBackgroundColor(double percentage) {
    if (percentage >= 70) {
      return Color(0xffBEAE02);
    } else if (percentage >= 40) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          '${percentage.toInt()}%',
          style: TextStyle(
            color: _getBackgroundColor(percentage),
            fontWeight: FontWeight.bold,
            fontFamily: "CustomFont",
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
