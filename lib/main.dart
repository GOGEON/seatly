import 'package:flutter/material.dart';
import 'package:seatly/screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const SeatlyApp());
}

class SeatlyApp extends StatelessWidget {
  const SeatlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'seatly',
      theme: ThemeData(
        primaryColor: const Color(0xFFCFA857),
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      //home: const SplashScreen(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
