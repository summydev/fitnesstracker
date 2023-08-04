import 'package:flutter/material.dart';
import 'package:quizapp/views/screens/sciencequiz.dart';

import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                text: 'Science',
                onPressed: () {
                  print('pressessss');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScienceQuiz(),
                      ));
                },
              ),
              CustomButton(
                text: 'Technology',
                onPressed: () {},
              ),
              CustomButton(
                text: 'Engineering',
                onPressed: () {},
              ),
              CustomButton(
                text: 'Mathematics',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
