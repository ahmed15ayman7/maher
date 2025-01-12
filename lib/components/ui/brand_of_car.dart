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
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: carBrands.length,
            itemBuilder: (context, index) {
              return Column(
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
                  SizedBox(height: 8),
                  Text(
                    carBrands[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
