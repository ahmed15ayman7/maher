import 'package:flutter/material.dart';

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    double offsetX = size.width / 14; // أضف إزاحة

    path.cubicTo(
      (size.width / 12) + offsetX, // حرك النقطة الأولى لليمين
      0,
      (size.width / 12) + offsetX,
      2 * size.height / 24,
      (2 * size.width / 12) + offsetX,
      2 * size.height / 24,
    );

    path.cubicTo(
      (3 * size.width / 12) + offsetX, // حرك النقطة الثانية لليمين
      2 * size.height / 24,
      (3 * size.width / 12) + offsetX,
      0,
      (4 * size.width / 12) + offsetX, // حرك النقطة الثالثة لليمين
      0,
    );

    // //first curve
    // path.cubicTo(size.width / 12, 0, size.width / 12, 2 * size.height / 24,
    //     2 * size.width / 12, 2 * size.height / 24);

    // path.cubicTo(3 * size.width / 12, 2 * size.height / 24, 3 * size.width / 12,
    //     0, 4 * size.width / 12, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
