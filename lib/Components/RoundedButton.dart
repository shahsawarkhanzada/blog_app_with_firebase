import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String title;
  final VoidCallback onPress;

  RoundedButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        height: height * 0.08,
        width: width * 0.8,
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
