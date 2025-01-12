import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productCode;
  final String description;
  final String quantity;
  final String price;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productCode,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF263238), // Background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image:
                    AssetImage(imageUrl), // Replace with NetworkImage if needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12), // Spacing
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اسم القطعة: $productName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'رقم القطعة: $productCode',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'الوصف: $description',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),

                const SizedBox(height: 6), // Spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الكمية: $quantity',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'السعر: $price',
                      style: const TextStyle(
                        color: Color(0xFFE040FB), // Purple color
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
