import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seatly/screens/home_screen.dart';
import 'package:seatly/screens/recent_screen.dart';
import 'package:seatly/screens/favorites_screen.dart';
import 'package:seatly/screens/review_screen.dart';
import 'package:seatly/screens/signup_screen.dart';
import 'package:seatly/screens/splash_screen.dart';

import 'firebase_options.dart';

// 글로벌 RouteObserver 선언
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const SplashScreen(),
      //home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(initialIndex: 0),
        '/search': (context) => const HomeScreen(initialIndex: 1),
        '/mypage': (context) => const HomeScreen(initialIndex: 2),
        '/recent': (context) => const RecentScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/review': (context) => const ReviewScreen(),
      },
      navigatorObservers: [routeObserver], // RouteObserver 추가
    );
  }
}
