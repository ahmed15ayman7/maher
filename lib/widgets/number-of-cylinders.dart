import 'package:flutter/material.dart';
import 'package:maher/components/ui/dynamic_list_item.dart';

class NumberOfCylinders extends StatelessWidget {
  final List<Map<String, String>> carNumCylinders = [
    {'model': '4', 'description': "عدد الاسطوانات"},
    {'model': '6', 'description': "عدد الاسطوانات"},
    {'model': '8', 'description': "عدد الاسطوانات"},
    {'model': '12', 'description': "عدد الاسطوانات"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ...carNumCylinders.map((item) {
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
