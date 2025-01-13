import 'package:flutter/material.dart';
import 'package:maher/components/card/DynamicCard.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/screens/car/AddMaintenance.dart';
import 'package:maher/screens/car/add_car_screen.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class ChangeOilScreen extends StatefulWidget {
  const ChangeOilScreen({super.key});
  @override
  _ChangeOilScreenState createState() => _ChangeOilScreenState();
}

class _ChangeOilScreenState extends State<ChangeOilScreen> {
  @override
  Widget build(BuildContext context) {
    // Dark background color
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: Padding(
            padding: const EdgeInsets.all(0),
            child: SingleChildScrollView(
                child: Column(children: [
              CustomAppBar(
                title: 'تغيير زيت',
                showBackButton: true,
                showEndIcon: true,
                endIcon: Icons.add_circle_outline_outlined,
                onActionPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddMaintenanceScreen()));
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribute space
                  children: [
                    DynamicCard(
                      // isProgressPercentage: true,
                      title: 'تغيير زيت',
                      timesChanged: 1,
                      startDate: '07/12/2024',
                      endDate: '21/01/2025',
                      approvals: 0,
                      progressPercentage: 43,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        WelcomeContent(
                          imageHeight: 86,
                          content: WelcomeContentModel(
                            description: 'لا يوجد صيانة مضافة',
                            imagePath: "assets/images/change-oil-Icon.png",
                            title: "",
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: GradientButton(
                        text: "اضافة صيانه ",
                        icon: Icons.add_circle_outline,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCarScreen()));
                        },
                      ),
                    )
                  ],
                ),
              )
            ]))));
  }
}
