import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  final bool isActive;

  GradientBorderPainter({required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    // if (!isActive) return;

    final paint = Paint()
      ..shader = LinearGradient(
        colors: isActive
            ? [
                Color(0xFF00D2FF), // Cyan
                Color(0xFFFF00FF), // Pink
              ]
            : [
                Colors.black87, // Cyan
                Color(0xff360336), // Pink
              ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(GradientBorderPainter oldDelegate) {
    return oldDelegate.isActive != isActive;
  }
}

class VerificationInput extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final int length;

  const VerificationInput({
    super.key,
    required this.value,
    required this.onChanged,
    this.length = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        length,
        (index) => Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Colors.transparent,
            borderRadius: BorderRadius.circular(0),
          ),
          child: CustomPaint(
            painter: GradientBorderPainter(
              isActive: value.length == index,
            ),
            child: Center(
              child: Text(
                index < value.length ? value[index] : '',
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "CustomFont",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
