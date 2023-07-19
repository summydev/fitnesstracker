import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key, required this.result, required this.questionLength, required this.onPressed});
  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? 'Almost There'
                  : result < questionLength / 2
                      ? 'Try Again ohh no'
                      : 'Great!',
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                "start over",
                style: TextStyle(
                    fontSize: 28, letterSpacing: 2.0, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
