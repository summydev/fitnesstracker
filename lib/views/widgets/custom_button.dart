import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text, required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF00B4DB),
                Color(0xFF0083B0),
              ],
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: kButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
