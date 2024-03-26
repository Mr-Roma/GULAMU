import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/pages/graphic_page.dart';
import 'package:team_10_app/pages/home_page.dart';
import 'package:team_10_app/pages/konsumsi_page.dart';
import 'package:team_10_app/pages/profile_page.dart';
import 'package:team_10_app/widgets/homepage_widget/popup.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      GraphicPage(),
      RiwayatKonsumsiPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: screens[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                backgroundColor: Colors.white,
                title: Text(
                  "Menyantap apa kali ini?",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: PopUp(),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(
          'assets/icons/addbutton.png',
          scale: 1.5,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => setState(() => index = i),
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A3FF),
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/home.png'),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/grafik.png'),
            ),
            label: 'Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histori',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/profile.png'),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
