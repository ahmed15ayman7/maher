import 'package:flutter/material.dart';
import 'package:maher/components/ui/dynamic_list_item.dart';

class CarModelSelection extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ...carModels.map((item) {
          return DynamicListItem(
            model: item['model']!,
            description: item['description']!,
          );
        }).toList(),
        const SizedBox(height: 16),
      ],
    );
  }
}
