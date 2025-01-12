import 'package:flutter/material.dart';
import 'package:maher/components/ui/custom_text_field.dart';

class CarColorSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carColors = [
    {'color': Colors.grey, 'label': 'الأصفر (Gray)'},
    {'color': Color(0xff61645d), 'label': 'الفضي (Silver)'},
    {'color': Colors.white, 'label': 'الأبيض (White)'},
    {'color': Colors.blue, 'label': 'الأزرق (Blue)'},
    {'color': Colors.red, 'label': 'الأحمر (Red)'},
    {'color': Colors.black, 'label': 'الأسود (Black)'},
    {'color': Colors.purple, 'label': 'البنفسجي (Purple)'},
    {'color': Colors.orange, 'label': 'البرتقالي (Orange)'},
    {'color': Colors.green, 'label': 'الأخضر (Green)'},
    {'color': Color(0xff92920b), 'label': 'الذهبي (Gold)'},
    {'color': Color(0xff581b04), 'label': 'البيج (Beige)'},
    {'color': Colors.brown, 'label': 'البني (Brown)'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // لون الخلفية
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomTextField(
              placeholder: 'ابحث عن لون السيارة',
              prefixIcon: Icons.search,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: carColors.length,
              itemBuilder: (context, index) {
                final colorInfo = carColors[index];
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: colorInfo['color'],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      colorInfo['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
