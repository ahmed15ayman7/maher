import 'package:flutter/material.dart';
import 'package:maher/components/card/ProductCard.dart'; // Import the ProductCard widget

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "productName": "جنط بيريللي الرياضي 18 بوصة",
      "productCode": "P18-PRL-2024",
      "description":
          "جنط رياضي عالي الأداء من بيريللي، مصنوع من سبائك خفيفة لزيادة الوزن والأداء والتحمل.",
      "quantity": "1",
      "price": "\$1500",
      "imageUrl": "assets/images/product1.png", // Example image path
    },
    {
      "productName": "زيت بيريللي 5W-30 للمحرك",
      "productCode": "PZ-5W30-2024",
      "description":
          "زيت محرك عالي الجودة من بيريللي، يوفر حماية فائقة للمحرك في درجات الحرارة المرتفعة.",
      "quantity": "1",
      "price": "\$80",
      "imageUrl": "assets/images/product1.png", // Example image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set direction to RTL
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // To stretch to full width
          children: products.map((product) {
            return ProductCard(
              productName: product["productName"]!,
              productCode: product["productCode"]!,
              description: product["description"]!,
              quantity: product["quantity"]!,
              price: product["price"]!,
              imageUrl: product["imageUrl"]!,
            );
          }).toList(),
        ),
      ),
    );
  }
}
