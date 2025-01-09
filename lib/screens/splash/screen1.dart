// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen1(),
//     );
//   }
// }

// class SplashScreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//             color: Colors.pink,
//             shape: BoxShape.circle,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SplashScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.cyan, Colors.pinkAccent],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SplashScreen3 extends StatefulWidget {
//   @override
//   _SplashScreen3State createState() => _SplashScreen3State();
// }

// class _SplashScreen3State extends State<SplashScreen3> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/video.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(true)
//       ..play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Center(child: CircularProgressIndicator()),
//           Center(
//             child: Text(
//               'MAHER\nماهر',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
