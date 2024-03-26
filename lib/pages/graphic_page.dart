import 'package:flutter/material.dart';
import 'package:team_10_app/widgets/homepage_widget/graph_card.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({super.key});

  @override
  Widget build(BuildContext context) {
    int total = 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GraphCard(
                totalGula: total,
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
