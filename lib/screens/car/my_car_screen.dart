import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/screens/car/add_car_screen.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class MyCarScreen extends StatefulWidget {
  const MyCarScreen({super.key});
  @override
  _MyCarScreenState createState() => _MyCarScreenState();
}

class _MyCarScreenState extends State<MyCarScreen> {
  @override
  Widget build(BuildContext context) {
    // Dark background color
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(
                        0xFF263238), // Dark gray color for the container
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text.rich(
                          TextSpan(
                            text: 'ادخل على الشرح لترى آلية طلب الخدمة, ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'انقر هنا',
                                style: const TextStyle(
                                  color: Color(0xFF00CED1), // Teal link color
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle link tap
                                    debugPrint('Link clicked');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8), // Spacing between text and icon
                      const Icon(
                        FontAwesomeIcons.youtube, // YouTube-style play icon
                        color: Color(
                            0xFFFF0000), // Gradient-like red color for the icon
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              WelcomeContent(
                content: WelcomeContentModel(
                  description: 'لم تقم باي اضافة للسيارة حتى الان',
                  imagePath: "assets/images/sedan-car-rafiki.png",
                  title: "قم باضافة سيارتك",
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GradientButton(
              text: "اضافة سيارة ",
              icon: Icons.add_circle_outline,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCarScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
