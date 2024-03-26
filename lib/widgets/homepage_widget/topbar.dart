import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                const CircleAvatar(
                  maxRadius: 16,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Halo, Fatir",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
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
