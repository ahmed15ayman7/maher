import 'package:flutter/material.dart';
import 'package:maher/components/ui/gradient_line.dart';

class DynamicListItem extends StatelessWidget {
  final String model;
  final String description;

  const DynamicListItem({
    Key? key,
    required this.model,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Model Name
                  Container(
                    width:
                        MediaQuery.of(context).size.width * 0.3, // Fixed width
                    child: Text(
                      model,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Description
                  Container(
                    width:
                        MediaQuery.of(context).size.width * 0.3, // Fixed width
                    alignment: Alignment.centerRight,
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              GradientLine(width: 277)
            ]));
  }
}
