import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maher/components/ui/custom_tabs.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/screens/product/product_list_screen.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});
  @override
  _ReservationsScreenState createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  int _selectedTabIndex = 2;

  final List<TabItem> _tabs = [
    TabItem(
      title: 'سابقا',
    ),
    TabItem(
      title: 'للدفع',
    ),
    TabItem(
      title: 'حاليا',
    ),
  ];

  final List<WelcomeContentModel> _tabContents = [
    WelcomeContentModel(
      title: "لا يوجد طلب دفع",
      description: 'لا يمكن الدفع لعدم وجود طلب للدفع قمت به',
      imagePath: "assets/images/for_payment.png",
    ),
    WelcomeContentModel(
      title: "لا يوجد طلب دفع",
      description: 'لا يمكن الدفع لعدم وجود طلب للدفع قمت به',
      imagePath: "assets/images/for_payment.png",
    ),
    WelcomeContentModel(
      title: "لا يوجد طلب فعال",
      description: 'يبدو انه لاتود طلبات نشطة متاحة الان',
      imagePath: "assets/images/current.png",
    ),
  ];

  void _handleTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF263238),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
                              color: Color(0xFF00CED1),
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint('Link clicked');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    FontAwesomeIcons.youtube,
                    color: Color(0xFFFF0000),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          CustomTabs(
            tabs: _tabs,
            selectedIndex: _selectedTabIndex,
            onTabSelected: _handleTabSelection,
          ),
          const SizedBox(height: 20),
          _selectedTabIndex == 0
              ? ProductListScreen()
              : WelcomeContent(
                  imageHeight: 370,
                  content: _tabContents[_selectedTabIndex],
                ),
        ],
      ),
    );
  }
}
