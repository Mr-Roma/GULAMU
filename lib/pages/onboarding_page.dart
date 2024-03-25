import 'package:flutter/material.dart';
import 'package:team_10_app/models/onboarding_model/onboarding_model.dart';
import 'package:team_10_app/onboarding_screen.dart';
import 'package:team_10_app/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var slides = [
      IntroScreen(
        title: 'Kurangi Konsumsi Gula Sedini Mungkin',
        imageAsset: 'assets/image/onboard_7.png',
        description:
            'Dengan fitur ini anda dapat mencatat semua makanan yang anda miliki di rumah, termasuk tanggal kadaluwarsa',
        headerBgColor: Colors.white,
      ),
      IntroScreen(
        title: 'Kontrol Konsumsi Gulamu Bersama Kami',
        headerBgColor: Colors.white,
        imageAsset: 'assets/image/onboard_6.png',
        description:
            "Temukan cara mengola sampah makanan kembali dengan benar, termasuk kompos dan metode lainnya untuk mengurangi limbah...",
      ),
    ];

    var lastSlide = slides.last;

    var screens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
      onSkip: () {},
      footerBgColor: Colors.blue.withOpacity(.8),
      activeDotColor: Colors.white,
      footerRadius: 18.0,
      slides: slides,
    );

    return Scaffold(
      body: screens,
    );
  }
}
