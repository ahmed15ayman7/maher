import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:maher/screens/auth/login_screen.dart';
import 'package:maher/screens/auth/verify_screen.dart';
import 'package:maher/screens/car/my_car_screen.dart';
import 'package:maher/screens/home/home_screen.dart';
import 'package:maher/screens/location/select_location_screen.dart';
import 'package:maher/screens/splash/screen1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maher App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        home: HomeScreen());
  }
}
