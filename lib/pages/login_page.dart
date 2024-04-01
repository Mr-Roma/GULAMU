import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:team_10_app/widgets/login_widget/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // Display error message for wrong email or password
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: Text(e.code == 'user-not-found'
                ? 'Incorrect Email!'
                : 'Incorrect Password!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 175, 222),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Animate(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 175, 222),
                ),
                child: Center(
                    child: Image.asset('assets/image/onboard_child2.png')),
              ),
            ).fadeIn(duration: Duration(seconds: 1)),
            Animate(
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.65, // Adjust height as needed
                child: Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child: Text(
                                  "Masuk Sekarang",
                                  style: TextStyle(
                                    fontFamily: 'Jakarta',
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "Masuk ke akunmu dengan cara mengisi formulir dfi bawah ini",
                                style: TextStyle(
                                  fontFamily: 'Jakarta',
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Email'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Password'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //password Textfield
                          MyTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                          SizedBox(height: 40),
                          MyButton(
                            onTap: signUserIn,
                            text: 'Masuk Sekarang',
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ).slide(begin: Offset(0, 1), duration: Duration(seconds: 1)),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
