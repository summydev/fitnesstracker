import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Text('Science'),
            ),
            Container(
              child: Text('Technology'),
            )
          ],
        ),
        Row(
          children: [
            Container(
              
              child: Text('Engineering'),
            ),
            Container(
              child: Text('Mathematics'),
            )
          ],
        ),
      ],
    );
  }
}
