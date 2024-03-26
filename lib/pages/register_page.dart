import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_10_app/widgets/login_widget/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final namaAwal = TextEditingController();

  final namaAkhir = TextEditingController();

  void createUser() {
    final newUser = {
      'namaAwal': namaAwal.text,
      'namaAkhir': namaAkhir.text,
      'timestamp': DateTime.now().microsecondsSinceEpoch
    };
    FirebaseFirestore.instance.collection('username').add(newUser);
    namaAwal.text = "";
    namaAkhir.text = "";
  }

  void register() async {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == passwordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        createUser();
        if (!mounted) return;
        Navigator.pop(context); // Close loading dialog
        // Optionally, you can navigate to another screen upon successful registration
      } else {
        // Show error message
        showErrorMessage('password-mismatch');
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context); // Close loading dialog
      // Display error message
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String errorCode) {
    String errorMessage;
    switch (errorCode) {
      case 'email-already-in-use':
        errorMessage = 'Email is already in use. Please use a different email.';
        break;
      case 'invalid-email':
        errorMessage = 'Invalid email address. Please enter a valid email.';
        break;
      case 'weak-password':
        errorMessage = 'Password is too weak. Please use a stronger password.';
        break;
      case 'password-mismatch':
        errorMessage =
            'Passwords do not match. Please enter matching passwords.';
        break;
      default:
        errorMessage = 'An unexpected error occurred. Please try again later.';
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 175, 222),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 175, 222),
              ),
              child: Image.asset('assets/image/onboard_child1.png'),
            ),
            Container(
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
                            "Yuk, Daftar Dulu!",
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          " Registrasi akunmu dengan mengisi formulir di bawah ini",
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Text('Nama Awal'),
                          SizedBox(width: 110),
                          Text('Nama Akhir'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: MyTextField(
                            controller: namaAwal,
                            hintText: 'Nama Awal',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: MyTextField(
                            controller: namaAkhir,
                            hintText: 'Nama Akhir',
                            obscureText: false,
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
                      onTap: register,
                      text: 'Daftar Sekarang',
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dengan melanjutkan, kamu menyetujui',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Kebijakan dan Privasi',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'kami',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun?',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Open',
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
