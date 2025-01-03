import 'package:blog_app/Components/RoundedButton.dart';
import 'package:blog_app/auth/Login_screen.dart';
import 'package:blog_app/auth/Register_screen.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/firebase_image2.png'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            RoundedButton(
              title: 'Log In',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: height * 0.03,
            ),
            RoundedButton(
              title: 'Register',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
