import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPress;
  final VoidCallback onBackspace;

  const NumberPad({
    super.key,
    required this.onNumberPress,
    required this.onBackspace,
  });

  Widget _buildButton(String text, VoidCallback onPressed) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: text == 'back'
                ? const Icon(Icons.arrow_back, size: 24)
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...List.generate(9, (index) {
          return _buildButton(
            (index + 1).toString(),
            () => onNumberPress((index + 1).toString()),
          );
        }),
        const SizedBox(),
        _buildButton('0', () => onNumberPress('0')),
        _buildButton('back', onBackspace),
      ],
    );
  }
}
