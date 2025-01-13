import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String year;
  final String carName;
  final String carDetails;
  final String logoUrl; // Add a URL or asset path for the logo
  final bool showDeleteButton;

  const CarCard({
    Key? key,
    required this.year,
    required this.carName,
    required this.carDetails,
    required this.logoUrl,
    this.showDeleteButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  carName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  carDetails,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Image.network(
                logoUrl,
                height: 50,
                width: 50,
              ),
              if (showDeleteButton)
                IconButton(
                  onPressed: () {
                    // Add delete action
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.redAccent,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            CarCard(
              year: '2024',
              carName: 'BMW الفئة السابعة',
              carDetails: '14 | ق م ر',
              logoUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/4/44/BMW.svg',
              showDeleteButton: false,
            ),
            CarCard(
              year: '2024',
              carName: 'BMW الفئة السابعة',
              carDetails: '14 | ق م ر',
              logoUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/4/44/BMW.svg',
              showDeleteButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
