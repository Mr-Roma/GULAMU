import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  int i = 0;
  Color currentColor1 = Colors.grey,
      currentColor2 = Colors.grey,
      currentColor3 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentColor1 = const Color(0xFF0E90F9);
                  currentColor2 = Colors.grey;
                  currentColor3 = Colors.grey;
                });
              },
              child: Container(
                height: 60,
                width: 69,
                decoration: BoxDecoration(
                  border: Border.all(color: currentColor1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/food.png"),
                    Text(
                      "Makanan",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: currentColor1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentColor1 = Colors.grey;
                  currentColor2 = const Color(0xFF0E90F9);
                  currentColor3 = Colors.grey;
                });
              },
              child: Container(
                height: 60,
                width: 69,
                decoration: BoxDecoration(
                  border: Border.all(color: currentColor2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/snack.png"),
                    Text(
                      "Snack",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: currentColor2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentColor1 = Colors.grey;
                  currentColor2 = Colors.grey;
                  currentColor3 = const Color(0xFF0E90F9);
                });
              },
              child: Container(
                height: 60,
                width: 69,
                decoration: BoxDecoration(
                  border: Border.all(color: currentColor3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/tea.png"),
                    Text(
                      "Minuman",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: currentColor3,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Nama Santapan",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 35,
          child: TextField(
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: currentColor3,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Masukkan nama santapan',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Kandungan Gula",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 35,
          child: TextField(
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: currentColor3,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Masukkan kandung gula',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Jumlah Makanan",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  i--;
                });
              },
              child: const Icon(
                Icons.remove_circle_outline_rounded,
                size: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              i.toString(),
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  i++;
                });
              },
              child: const Icon(
                Icons.add_circle_outline,
                size: 18,
                color: Colors.blue,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 30,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF0E90F9),
            ),
            child: Center(
              child: Text(
                "Simpan",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
