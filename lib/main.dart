import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_10_app/constants/route_constant.dart';
import 'package:team_10_app/pages/onboarding_page.dart';
import 'package:team_10_app/routes/app_pages.dart';
import 'package:team_10_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      builder: (context) => MainApp(), // Wrap your app
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.splash,
      routes: {
        RouteConstant.splash: (context) => SplashScreen(),
        RouteConstant.onboardingpage: (context) => OnboardingPage(),
      },
      getPages: AppPages.routes,
      home: Scaffold(),
    );
  }
}
