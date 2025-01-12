import 'package:flutter/material.dart';
import 'package:maher/components/ui/custom_text_field.dart';

class CarModelSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> carModels = [
    {'model': 'X4', 'description': 'اكس 4'},
    {'model': 'X5', 'description': 'اكس 5'},
    {'model': 'X6', 'description': 'اكس 6'},
    {'model': 'X7', 'description': 'اكس 7'},
    {'model': 'Series M', 'description': 'الفئة M'},
    {'model': 'Series X', 'description': 'الفئة X'},
    {'model': 'Series Z', 'description': 'الفئة Z'},
    {'model': 'Series 1', 'description': 'الفئة الأولى'},
    {'model': 'Series 2', 'description': 'الفئة الثانية'},
    {'model': 'Series 3', 'description': 'الفئة الثالثة'},
    {'model': 'Series 4', 'description': 'الفئة الرابعة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // لون الخلفية
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              placeholder: 'ابحث عن اسم موديل السيارة',
              prefixIcon: Icons.search,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: carModels.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final carModel = carModels[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      carModel['model']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      carModel['description']!,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
