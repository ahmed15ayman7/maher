import 'package:flutter/material.dart';

class GradientButton2 extends StatelessWidget {
  final VoidCallback? onTap; // Optional onTap
  final IconData? icon; // Optional icon
  final String? text; // Optional icon
  final bool isText; // Optional icon

  const GradientButton2({
    Key? key,
    this.onTap, // Nullable onTap
    this.icon, // Optional icon
    this.text, // Optional icon
    this.isText = false, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Can be null
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        width: isText ? 100 : 50,
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
        child: isText
            ? Text(
                '$text',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "CustomFont"),
              )
            : Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
      ),
    );
  }
}
