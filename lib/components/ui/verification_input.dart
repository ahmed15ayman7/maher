import 'package:flutter/material.dart';

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
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: value.length == index
                  ? const Color(0xFFa855f7)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              index < value.length ? value[index] : '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
