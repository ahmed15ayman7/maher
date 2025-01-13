import 'package:flutter/material.dart';
import 'package:maher/components/ui/custom_text_field.dart';

class CarBrandSelectionScreen extends StatelessWidget {
  final List<String> carBrands = [
    'تويوتا (Toyota)',
    'بي ام دبليو (BMW)',
    'هيونداي (Hyundai)',
    'مرسيدس بنز (Mercedes-Benz)',
    'كيا (Kia)',
    'نيسان (Nissan)',
    'جي ام سي (GMC)',
    'شيفروليه (Chevrolet)',
    'فورد (Ford)',
    'فيراري (Ferrari)',
    'لكزس (Lexus)',
    'لاند روفر (Land Rover)',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomTextField(
            placeholder: 'ابحث عن اسم موديل السيارة',
            prefixIcon: Icons.search,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 16.0, // Horizontal space between items
            runSpacing: 16.0, // Vertical space between rows
            alignment: WrapAlignment.start,
            children: carBrands.map((brand) {
              return SizedBox(
                width: 90, // Fixed width for each item
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        'assets/marcedes.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      brand,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
