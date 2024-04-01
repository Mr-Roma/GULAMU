import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:team_10_app/widgets/homepage_widget/navbar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Animate(
                    child: Container(
                      height: 110,
                      color: Color(0xFF0E90F9),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ).slide(begin: Offset(1, 0), duration: Duration(seconds: 1)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: Animate(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBar(), // Replace ProfilePage with your profile page widget
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_back_ios, size: 15),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 40,
                        height: 40,
                      ),
                    ).slideX(duration: Duration(seconds: 1)),
                  ),
                  Animate(
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      child: const Center(
                        child: CircleAvatar(
                          minRadius: 55,
                          backgroundColor: Color(0xFF626262),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/IMG_5587.JPG'),
                            minRadius: 51,
                          ),
                        ),
                      ),
                    ),
                  ).fadeIn(duration: Duration(seconds: 1))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('username')
                              .orderBy('timestamp', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Mohon Tunggu');
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Text('Tidak ada Data');
                            }

                            // Extracting the first document to get the latest username
                            var latestDocument = snapshot.data!.docs.first;
                            var username = latestDocument.data()['namaAwal'] +
                                ' ' +
                                latestDocument.data()['namaAkhir'];

                            // Returning only the username in a Text widget
                            return Animate(
                              child: Row(
                                children: [
                                  Text('$username', // Displaying the username
                                      style: TextStyle(
                                          fontFamily: 'Exo',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey)),
                                  // Add more widgets if needed below
                                ],
                              ),
                            ).fadeIn(duration: Duration(seconds: 1));
                          },
                        ),
                      ],
                    ),
                  ),
                  Animate(
                    child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset('assets/edit.png')),
                  ).fadeIn(duration: Duration(seconds: 1))
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Animate(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 10),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pengaturan Akun",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset('assets/verifikasi.png'),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Verifikasi Akun",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.black54),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Pilihan Bahasa",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.black54),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Notifikasi",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ).slide(begin: Offset(1, 0), duration: Duration(seconds: 1)),
              SizedBox(
                height: 18,
              ),
              Animate(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 10),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pengaturan Lainnya",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: Colors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Laporan & Bantuan",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.black54),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset('assets/verifikasi.png'),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Ketentuan & Privasi",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.black54),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Berikan Rating",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ).slideX(duration: Duration(seconds: 1)),
              SizedBox(
                height: 18,
              ),
              Animate(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 10),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Keluar Akun",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Hapus Akun",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.black54),
                      Row(
                        children: [
                          IconButton(
                            iconSize: 18,
                            onPressed: signUserOut,
                            icon: Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Logout Akun",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ).slide(begin: Offset(1, 0), duration: Duration(seconds: 1)),
            ],
          ),
        ),
      ),
    );
  }
}
