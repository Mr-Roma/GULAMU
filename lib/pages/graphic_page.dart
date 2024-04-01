import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_10_app/widgets/homepage_widget/graph_card.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Animate(
                child: GraphCard(
                  totalGula: total,
                ),
              ).slide(begin: Offset(0, -1), duration: Duration(seconds: 1)),
              Animate(
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Details Analytics',
                          style: TextStyle(
                              fontFamily: 'Open',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Animate(
                          child: AnalyticsDetailsWidget(
                            totalGula: total,
                            description: 'Harian',
                          ),
                        ).fadeIn(duration: Duration(seconds: 2)),
                        SizedBox(height: 20),
                        Animate(
                          child: AnalyticsDetailsWidget(
                            totalGula: total,
                            description: 'Mingguan',
                          ),
                        ).fadeIn(duration: Duration(seconds: 2)),
                        SizedBox(height: 20),
                        Animate(
                          child: AnalyticsDetailsWidget(
                            totalGula: total,
                            description: 'Bulanan',
                          ),
                        ).fadeIn(duration: Duration(seconds: 2)),
                      ],
                    ),
                  ),
                ),
              ).slide(begin: Offset(0, 1), duration: Duration(seconds: 1))
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsDetailsWidget extends StatelessWidget {
  final int totalGula;
  final String description;

  const AnalyticsDetailsWidget(
      {Key? key, required this.totalGula, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Gula:',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                '$totalGula',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Add more details here as needed
        ],
      ),
    );
  }
}
