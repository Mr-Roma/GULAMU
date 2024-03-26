import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_10_app/login_register.dart';
import 'package:team_10_app/widgets/homepage_widget/navbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is user logged in
          if (snapshot.hasData) {
            return NavBar();
          }
          //is not logged in
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
