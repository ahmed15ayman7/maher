import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/dynamic_list_item.dart';

class TypesOil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            GradientButton(
              text: "بنزين",
              onTap: () {},
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: "ديزل",
              onTap: () {},
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: "كهربائية",
              onTap: () {},
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: "هجين",
              onTap: () {},
            ),
            const SizedBox(height: 16),
          ],
        ));
  }
}
