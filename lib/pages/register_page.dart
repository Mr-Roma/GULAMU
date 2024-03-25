import 'package:flutter/material.dart';
import 'package:team_10_app/widgets/login_widget/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
              child:
                  Center(child: Image.asset('assets/image/onboard_child2.png')),
            ),
            Container(
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
                        MasukButton(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MasukButton extends StatelessWidget {
  const MasukButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Masuk Sekarang',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
