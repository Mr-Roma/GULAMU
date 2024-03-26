import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ArticledetailView extends StatelessWidget {
  const ArticledetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Artikel Edukasi",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gula: Sahabat atau Musuh",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse_outlined,
                          color: Color(0x33000000),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "2 menit membaca",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0x33000000),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 178,
                      width: 338,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/icons/artikel1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "Gula memberikan energi penting, tetapi konsumsi berlebihan bisa membahayakan. Lonjakan gula darah yang cepat dapat mengganggu keseimbangan energi dan meningkatkan risiko obesitas, diabetes, dan penyakit jantung. Namun, memilih sumber gula yang baik seperti buah-buahan segar dan mengurangi konsumsi gula tambahan dari makanan olahan dapat membantu menjaga kesehatan. Dengan memahami perannya dengan bijak, kita bisa menjaga keseimbangan dan menikmati manfaat tanpa risiko berlebihan. Mengambil langkah-langkah sederhana seperti membatasi makanan dan minuman manis serta memperbanyak konsumsi makanan alami dapat membantu kita tetap sehat dan bugar tanpa mengorbankan kesenangan dari gula dalam hidup kita.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ArticledetailView2 extends StatelessWidget {
  const ArticledetailView2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Artikel Edukasi",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mendekati Gula dengan...",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse_outlined,
                          color: Color(0x33000000),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "2 menit membaca",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0x33000000),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 178,
                      width: 338,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/icons/artikel2.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "Gula memberikan energi penting, tetapi konsumsi berlebihan bisa membahayakan. Lonjakan gula darah yang cepat dapat mengganggu keseimbangan energi dan meningkatkan risiko obesitas, diabetes, dan penyakit jantung. Namun, memilih sumber gula yang baik seperti buah-buahan segar dan mengurangi konsumsi gula tambahan dari makanan olahan dapat membantu menjaga kesehatan. Dengan memahami perannya dengan bijak, kita bisa menjaga keseimbangan dan menikmati manfaat tanpa risiko berlebihan. Mengambil langkah-langkah sederhana seperti membatasi makanan dan minuman manis serta memperbanyak konsumsi makanan alami dapat membantu kita tetap sehat dan bugar tanpa mengorbankan kesenangan dari gula dalam hidup kita.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
