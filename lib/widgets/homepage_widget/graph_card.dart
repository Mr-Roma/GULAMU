import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/widgets/homepage_widget/line_chart.dart';

class GraphCard extends StatelessWidget {
  const GraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 292,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            height: 57,
            decoration: const BoxDecoration(
                color: Color(0xFF08A6FF),
                image: DecorationImage(
                  image: AssetImage("assets/icons/activity.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              children: [
                Image.asset('assets/icons/pulse.png', scale: 0.8),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Konsumsi-mu normal, tapi masih perlu dikurangi",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 57,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hari ini",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      Text(
                        "32 gr",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 15,
                    color: Color(0xFFE9E9E9),
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Batas harian",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      Text(
                        "12 gr",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 15,
                    color: Color(0xFFE9E9E9),
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Bulan ini",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      Text(
                        "32gr",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xFFE9E9E9),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: LineChartWidget(),
          ),
        ],
      ),
    );
  }
}
