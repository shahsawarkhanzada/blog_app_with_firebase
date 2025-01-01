import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Register Yourself',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password', enabledBorder: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
