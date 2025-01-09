import 'package:flutter/material.dart';

class GradientBG3 extends StatelessWidget {
  final Widget child;
  const GradientBG3({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00CED1),
            Color(0xFFFF5BF8),
            Color(0xFFC903C0),
          ],
        ),
      ),
      child: child,
    );
  }
}
