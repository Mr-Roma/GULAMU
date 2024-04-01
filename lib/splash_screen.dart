import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';

import 'package:team_10_app/constants/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logo1Visible = true;
  bool logo2Visible = true;
  bool logo3Visible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, RouteConstant.onboardingpage);
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        logo1Visible = false;
      });
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        logo2Visible = false;
      });
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        logo3Visible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              child: Stack(
                children: [
                  if (logo1Visible)
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 15, top: 15),
                      child: Animate(
                        child: Image.asset('assets/image/logo1.png'),
                      ).slideY(duration: Duration(seconds: 2)),
                    ),
                  if (logo2Visible)
                    Padding(
                      padding: EdgeInsets.only(left: 28, right: 22),
                      child: Animate(
                        child: Image.asset('assets/image/logo2.png'),
                      ).slide(
                        begin: Offset(1, 0),
                        duration: Duration(seconds: 2),
                      ),
                    ),
                  if (logo3Visible)
                    Padding(
                      padding: EdgeInsets.only(left: 110, top: 80, right: 55),
                      child: Animate(
                        child: Image.asset('assets/image/logo3.png'),
                      ).slideX(duration: Duration(seconds: 2)),
                    ),
                  Align(
                      alignment: Alignment.center,
                      child: Animate(
                              child: SizedBox(
                                  width: 650,
                                  height: 350,
                                  child: Image.asset('assets/image/logo.png')))
                          .fadeIn(
                              duration: Duration(seconds: 2),
                              delay: Duration(seconds: 2))),
                  Animate(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 30),
                      child: Container(
                        width: 300,
                        height: 250,
                        child: Image.asset('assets/gulamu_logo.png'),
                      ),
                    ),
                  ).fadeIn(duration: Duration(seconds: 2)),
                ],
              ),
            ),
            Text(
              'Kontrol Konsumsi Gulamu',
              style: TextStyle(
                  fontFamily: 'Open',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
