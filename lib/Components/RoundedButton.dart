import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String title;

  RoundedButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.orange),
      height: height * 0.08,
      width: width * 0.8,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      )),
    );
  }
}
