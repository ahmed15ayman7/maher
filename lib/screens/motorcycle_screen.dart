import 'package:maher/components/ui/GradientBG.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/models/HelloCard-models.dart';
import 'package:maher/widgets/HelloCard.dart';
import 'package:flutter/material.dart';

class MotorcycleScreen extends StatelessWidget {
  const MotorcycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBG3(
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'دراجاتي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Red Notice Bar
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'ادخل على الشريط لطلب الخدمة اضغط هنا',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),

              // Empty State
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HelloCard(
                        HellocardInterface: Hellocard(
                            id: '4',
                            model: "2002",
                            year: "2002",
                            imageUrl: "assets/hello.jpg"),
                        onTap: () => {print("oo")},
                      ),
                      Image.asset(
                        'assets/images/hello.jpg', // Add motorcycle image to assets
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'قم بإضافة دراجتك',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'لم تقم بأي إضافة دراجة حتى الآن',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Add Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2ACDDF),
                        Color(0xFFE341FF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30), // مطابق لشكل الزر
                  ),
                  child: GradientButton(
                    text: 'التالي:',
                    onTap: () {
                      print('Button with icon pressed!');
                    },
                    icon: Icons.arrow_forward,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
