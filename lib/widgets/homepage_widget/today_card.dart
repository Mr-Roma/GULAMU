import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Today extends StatelessWidget {
  final gulaMakanan;
  final gulaCemilan;
  final gulaMinuman;
  final totalGula;
  const Today(
      {super.key,
      this.gulaMakanan,
      this.gulaCemilan,
      this.gulaMinuman,
      this.totalGula});

  @override
  Widget build(BuildContext context) {
    String status = totalGula >= 50 ? "Tidak Normal" : "Normal";
    Color statusColor = totalGula >= 50 ? Colors.red : Colors.green;
    return Container(
        height: 496,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: -20,
                child: Image.asset('assets/icons/sugarcube.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/calendar-date.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "August 28, 2024",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF6E6E6E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Konsumsi Gula Hari ini",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 26,
                        width: 56,
                        decoration: BoxDecoration(
                          color: Color(0x222E69FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            totalGula.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF2E69FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 26,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0x220AB845),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pulse.png',
                                color: statusColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                status,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: statusColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 187,
                    decoration: BoxDecoration(
                      color: const Color(0xDDF7A94C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -10,
                          child: Image.asset('assets/icons/makanan.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gulaMakanan.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Target 28 gr",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 69,
                              ),
                              Text(
                                "Makanan",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Klik untuk lihat lebih detail",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 168,
                        width: 155,
                        decoration: BoxDecoration(
                          color: const Color(0xDD08A6FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -10,
                              top: 14,
                              child: Image.asset(
                                'assets/icons/minuman.png',
                                scale: 1.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    gulaMinuman.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Target 28 gr",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 72,
                                  ),
                                  Text(
                                    "Minuman",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 168,
                        width: 155,
                        decoration: BoxDecoration(
                          color: const Color(0xDD00C9A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -10,
                              top: 14,
                              child: Image.asset(
                                'assets/icons/cemilan.png',
                                scale: 1.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    gulaCemilan.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Target 28 gr",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 72,
                                  ),
                                  Text(
                                    "Cemilan",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
