import 'package:blog_app/Components/RoundedButton.dart';
import 'package:blog_app/auth/Register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onPress: () {},
            ),
            SizedBox(
              height: height * 0.03,
            ),
            RoundedButton(
              title: 'Register',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
