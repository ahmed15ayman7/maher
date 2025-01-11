import 'package:flutter/material.dart';

class BgCard extends StatelessWidget {
  final Widget child;
  final bool isDark;
  final bool isCustom;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double? width;
  final double? height;
  const BgCard({
    Key? key,
    required this.child,
    this.isDark = false,
    this.isCustom = false,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 20,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: isCustom
            ? Color(0xff263238)
            : isDark
                ? Color(0xff424347)
                : Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
