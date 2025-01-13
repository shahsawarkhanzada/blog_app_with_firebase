import 'package:blog_app/Components/RoundedButton.dart';
import 'package:blog_app/auth/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Forgot Passwrod'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter email',
                  enabledBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  return value!.isEmpty ? "Enter email" : null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedButton(
                  title: 'Send Password',
                  onPress: () async {
                    if (formkey.currentState!.validate()) {}
                    try {
                      auth
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'A password-reset link has been sent to your email address')));
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
