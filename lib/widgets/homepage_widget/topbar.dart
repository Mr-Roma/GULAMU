import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/pages/profile_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(), // Replace ProfilePage with your profile page widget
                      ),
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 16,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('username')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Mohon Tunggu');
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text('Tidak ada Data');
                    }

                    // Extracting the first document to get the latest username
                    var latestDocument = snapshot.data!.docs.first;
                    var username = latestDocument.data()['namaAwal'];

                    // Returning only the username in a Text widget
                    return Row(
                      children: [
                        Text(
                          'Halo, $username!', // Displaying the username
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        // Add more widgets if needed below
                      ],
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('dingdong');
              },
              child: const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
