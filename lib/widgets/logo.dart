import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double topSpacing;
  final double bottomSpacing;

  const LogoWidget({
    Key? key,
    this.height = 40,
    this.topSpacing = 30,
    this.bottomSpacing = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topSpacing,
        bottom: bottomSpacing,
      ),
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        height: height,
      ),
    );
  }
}
