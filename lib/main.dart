import 'package:flutter/material.dart';
import 'package:team_10_app/constants/route_constant.dart';
import 'package:team_10_app/pages/onboarding_page.dart';
import 'package:team_10_app/pages/register_page.dart';
import 'package:team_10_app/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.splash,
      routes: {
        RouteConstant.splash: (context) => SplashScreen(),
        RouteConstant.onboardingpage: (context) => OnboardingPage(),
      },
      home: Scaffold(),
    );
  }
}
