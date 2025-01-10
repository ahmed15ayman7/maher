import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap; // Optional onTap
  final IconData? icon; // Optional icon
  final bool disabled;
  const GradientButton({
    Key? key,
    required this.text,
    this.onTap, // Nullable onTap
    this.disabled = false, // Nullable onTap
    this.icon, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap, // Can be null
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        width: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: !disabled
                ? [
                    Color(0xFF00D2FF), // Cyan
                    Color(0xFFFF00FF), // Pink
                  ]
                : [
                    Colors.black87, // Cyan
                    Color(0xff360336), // Pink
                  ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
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
