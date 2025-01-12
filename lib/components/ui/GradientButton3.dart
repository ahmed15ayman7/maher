import 'package:flutter/material.dart';

class GradientButton3 extends StatelessWidget {
  final String text;
  final VoidCallback? onTap; // Optional onTap
  final IconData? icon; // Optional icon

  const GradientButton3({
    Key? key,
    required this.text,
    this.onTap, // Nullable onTap
    this.icon, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Can be null
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF00CED1),
              Color(0xFFFF5BF8),
              Color(0xFFFF5BF8),
              Color(0xFFC903C0),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
