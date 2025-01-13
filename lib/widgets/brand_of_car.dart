import 'package:flutter/material.dart';
import 'package:maher/components/card/CarColorCard.dart';
import 'package:maher/components/ui/custom_text_field.dart';

class CarBrandSelectionScreen extends StatelessWidget {
  final List<String> carBrands = [
    'تويوتا (Toyota)',
    'بي ام دبليو (BMW)',
    'هيونداي (Hyundai)',
    'مرسيدس  (Mercedes)',
    'كيا (Kia)',
    'نيسان (Nissan)',
    'جي ام سي (GMC)',
    'شيفروليه (Chevrolet)',
    'فورد (Ford)',
    'فيراري (Ferrari)',
    'لكزس (Lexus)',
    'لاند روفر (Land Rover)',
  ];

  List<List<String>> _chunkList(List<String> list, int chunkSize) {
    List<List<String>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
        i,
        i + chunkSize > list.length ? list.length : i + chunkSize,
      ));
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    final chunkedBrands = _chunkList(carBrands, 3);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomTextField(
            placeholder: 'ابحث عن اسم موديل السيارة',
            prefixIcon: Icons.search,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: chunkedBrands.map((rowBrands) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: rowBrands.map((brand) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      child: CarColorCard(
                        imagePath: "assets/images/BMW.png",
                        color: Colors.blue, // Replace with your logic
                        label: brand,
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
