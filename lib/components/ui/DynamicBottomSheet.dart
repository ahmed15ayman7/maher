// import 'package:flutter/material.dart';
// import 'package:maher/components/ui/GradientButton.dart';

// void _showSuccessBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     builder: (context) => DraggableScrollableSheet(
//       initialChildSize: 0.95,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       builder: (_, controller) => Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: SingleChildScrollView(
//           controller: controller,
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 16),
//                   // Add the circular gradient close button
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop(); // Close the bottom sheet
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [Colors.cyan, Colors.purple],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: const Center(
//                           child: Icon(
//                             Icons.close,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Image.asset("assets/images/VerificationSuccess.png"),
//                   const SizedBox(height: 40),
//                   const Text(
//                     'تمت عملية التحقق بنجاح',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'ابدا تجربتك الان بافضل تطبيق يقدم خدمات و منتجات للسيارات',
//                     style: TextStyle(
//                       color: Colors.grey[400],
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   GradientButton(
//                     text: 'ابدء تجربة الان',
//                     onTap: () {
//                       // Navigate to next screen
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
