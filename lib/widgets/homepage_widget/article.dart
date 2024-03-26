import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/article_view.dart';
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
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ArticledetailView())));
                    },
                    child: const ArticleCard(
                      title: "Gula: Sahabat atau Musuh?",
                      text:
                          "Apakah gula benar-benar musuh kesehatan kita, ataukah ia tetap menjadi sahabat dalam kehidupan sehari-hari? Pertanyaan ini sering kali membingungkan, tetapi jawabannya sebenarnya tidaklah hitam atau putih.",
                      url: "assets/icons/artikel1.png",
                    )),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ArticledetailView2())));
                  },
                  child: const ArticleCard(
                    title: "Mendekati Gula dengan Senyum",
                    text:
                        "Terkadang, gula dianggap sebagai musuh dalam upaya kita menjaga kesehatan. Namun, apakah kita benar-benar harus melihat gula sebagai ancaman yang harus dihindari sepenuhnya? Mengambil pendekatan yang lebih positif terhadap gula dapat membantu kita memahami peran pentingnya dalam memberikan energi dan kenikmatan dalam makanan kita sehari-hari.",
                    url: "assets/icons/artikel2.png",
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
