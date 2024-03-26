import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:team_10_app/navbar_view.dart';
import 'package:team_10_app/widgets/homepage_widget/article.dart';
import 'package:team_10_app/widgets/homepage_widget/graph_card.dart';
import 'package:team_10_app/widgets/homepage_widget/today_card.dart';
import 'package:team_10_app/widgets/homepage_widget/topbar.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          height: 10,
        ),
        Row(children: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
        ]),
        TopBar(),
        GraphCard(),
        SizedBox(
          height: 15,
        ),
        Today(),
        SizedBox(
          height: 29,
        ),
        Article(),
        SizedBox(
          height: 15,
        ),
      ],
    ));
  }
}
