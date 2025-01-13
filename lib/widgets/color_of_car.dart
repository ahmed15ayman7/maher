import 'package:flutter/material.dart';
import 'package:maher/components/card/CarColorCard.dart';
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

  List<List<Map<String, dynamic>>> _chunkList(
      List<Map<String, dynamic>> list, int chunkSize) {
    List<List<Map<String, dynamic>>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    final chunkedColors =
        _chunkList(carColors, 3); // Split the list into chunks of 3 items

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: CustomTextField(
              placeholder: 'ابحث عن لون السيارة',
              prefixIcon: Icons.search,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: chunkedColors.map((rowColors) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: rowColors.map((colorInfo) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        child: CarColorCard(
                          color: colorInfo['color'],
                          label: colorInfo['label'],
                        ));
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
