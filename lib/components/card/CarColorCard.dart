import 'package:flutter/material.dart';
import 'package:maher/components/ui/gradient_line.dart';

class CarColorCard extends StatelessWidget {
  final Color color;
  final String label;
  final String? imagePath; // Optional parameter for image

  const CarColorCard({
    Key? key,
    required this.color,
    required this.label,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 0.0), // Add horizontal spacing
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff2B414C),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      Icons.water_drop,
                      color: color,
                      size: 60,
                    ),
            ),
            const SizedBox(height: 8),
            GradientLine(
              width: 100,
              isColor: true,
              color: const Color(0xff263238),
            ),
            const SizedBox(height: 8),
            Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
