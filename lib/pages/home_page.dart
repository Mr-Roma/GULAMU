import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/navbar_view.dart';
import 'package:team_10_app/widgets/homepage_widget/article.dart';
import 'package:team_10_app/widgets/homepage_widget/graph_card.dart';
import 'package:team_10_app/widgets/homepage_widget/popup.dart';
import 'package:team_10_app/widgets/homepage_widget/today_card.dart';
import 'package:team_10_app/widgets/homepage_widget/topbar.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 10,
          ),
          Row(children: [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
          ]),
          TopBar(),
          GraphCard(),
          SizedBox(
            height: 15,
          ),
          Today(),
          SizedBox(
            height: 29,
          ),
          Article(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
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
            icon: ImageIcon(
              AssetImage('assets/icons/home.png'),
            ),
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
