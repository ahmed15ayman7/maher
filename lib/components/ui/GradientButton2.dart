import 'package:flutter/material.dart';

class GradientButton2 extends StatelessWidget {
  final VoidCallback? onTap; // Optional onTap
  final IconData icon; // Optional icon

  const GradientButton2({
    Key? key,
    this.onTap, // Nullable onTap
    required this.icon, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Can be null
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        width: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF00D2FF), // Cyan
              Color(0xFFFF00FF), // Pink
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
