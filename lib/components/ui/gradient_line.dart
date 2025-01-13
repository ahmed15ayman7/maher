import 'package:flutter/material.dart';

class GradientLine extends StatelessWidget {
  final double width;
  final double? height;
  final Color? color;
  final bool isColor;
  final EdgeInsetsGeometry padding;

  const GradientLine({
    Key? key,
    required this.width,
    this.height = 2,
    this.isColor = false,
    this.color,
    this.padding = EdgeInsets.zero, // Default no padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, // Apply dynamic padding
      child: Container(
        width: width, // Dynamic width
        height: height, // Dynamic height (thickness)
        decoration: BoxDecoration(
            gradient: isColor
                ? null
                : LinearGradient(
                    colors: [
                      Color(0xFF00CED1),
                      Color(0xFFFF5BF8),
                      Color(0xFFC903C0), // Pink
                    ],
                  ),
            color: isColor ? color : null),
      ),
    );
  }
}
