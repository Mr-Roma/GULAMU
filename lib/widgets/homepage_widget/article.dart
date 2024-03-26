import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/widgets/homepage_widget/article_card.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Artikel Edukasi",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 299,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ArticleCard(),
                SizedBox(
                  width: 15,
                ),
                ArticleCard(),
                SizedBox(
                  width: 15,
                ),
                ArticleCard(),
                SizedBox(
                  width: 15,
                ),
                ArticleCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
