import 'package:blog_app/Components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  final formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Account',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
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
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder()),
                onChanged: (String value) {
                  email = value;
                },
                validator: (value) {
                  return value!.isEmpty ? 'Enter email' : null;
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  password = value;
                },
                validator: (value) {
                  return value!.isEmpty ? 'Enter password' : null;
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              RoundedButton(
                  title: 'Get Register',
                  onPress: () async {
                    if (formkey.currentState!.validate()) {}
                  })
            ],
          ),
        ),
      ),
    );
  }
}
