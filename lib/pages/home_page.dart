import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team_10_app/widgets/homepage_widget/article.dart';
import 'package:team_10_app/widgets/homepage_widget/graph_card.dart';

import 'package:team_10_app/widgets/homepage_widget/today_card.dart';
import 'package:team_10_app/widgets/homepage_widget/topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num total = 0;
  num totalGulaMinuman = 0;
  num totalGulaMakanan = 0;
  num totalGulaCemilan = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 10,
          ),
          TopBar(),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('dataMakanan')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Mohon Tunggu');
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Text('Tidak ada Data');
              }
              for (var docu in snapshot.data!.docs) {
                total = total + (docu.data()['jumlahGula']);
                if (docu.data()['tipe'] == "Makanan") {
                  totalGulaMakanan += (docu.data()['jumlahGula']);
                }

                if (docu.data()['tipe'] == "Minuman") {
                  totalGulaMinuman += (docu.data()['jumlahGula']);
                }

                if (docu.data()['tipe'] == "Snack") {
                  totalGulaCemilan += (docu.data()['jumlahGula']);
                }
              }

              // Returning only the username in a Text widget
              return Column(
                children: [
                  GraphCard(
                    totalGula: total,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Today(
                    gulaMakanan: totalGulaMakanan,
                    gulaMinuman: totalGulaMinuman,
                    gulaCemilan: totalGulaCemilan,
                    totalGula: total,
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 29,
          ),
          Article(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
