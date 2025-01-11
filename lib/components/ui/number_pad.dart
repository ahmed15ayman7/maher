import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPress;
  final VoidCallback onBackspace;

  const NumberPad({
    super.key,
    required this.onNumberPress,
    required this.onBackspace,
  });

  Widget _buildButton(String text, VoidCallback onPressed, {String? letters}) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: text == 'back' ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: text == 'back'
                ? const Icon(
                    Icons.backspace_outlined,
                    size: 20,
                    color: Colors.white,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      if (letters != null)
                        Text(
                          letters,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton('1', () => onNumberPress('1')),
              _buildButton('2', () => onNumberPress('2'), letters: 'ABC'),
              _buildButton('3', () => onNumberPress('3'), letters: 'DEF'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton('4', () => onNumberPress('4'), letters: 'GHI'),
              _buildButton('5', () => onNumberPress('5'), letters: 'JKL'),
              _buildButton('6', () => onNumberPress('6'), letters: 'MNO'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton('7', () => onNumberPress('7'), letters: 'PQRS'),
              _buildButton('8', () => onNumberPress('8'), letters: 'TUV'),
              _buildButton('9', () => onNumberPress('9'), letters: 'WXYZ'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 80),
              _buildButton('0', () => onNumberPress('0')),
              _buildButton('back', onBackspace),
            ],
          ),
        ],
      ),
    );
  }
}
