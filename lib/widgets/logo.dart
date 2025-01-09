import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double topSpacing;
  final double bottomSpacing;

  const LogoWidget({
    Key? key,
    this.height = 80,
    this.topSpacing = 0,
    this.bottomSpacing = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topSpacing,
        bottom: bottomSpacing,
      ),
      child: Image.asset(
        'assets/images/logo.png',
        height: height,
      ),
    );
  }
}
