import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274,
      height: 299,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/icons/artikel1.png'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Gula: Sahabat atau Musuh",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Apakah gula benar-benar musuh kesehatan kita, ataukah ia tetap menjadi sahabat dalam kehidupan sehari-hari? Pertanyaan ini sering kali membingungkan, tetapi jawabannya sebenarnya tidaklah hitam atau putih.",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
