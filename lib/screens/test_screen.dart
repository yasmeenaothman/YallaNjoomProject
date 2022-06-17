import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Color(0x57FFFFFF), BlendMode.srcATop)),
      ),
    );
  }
}
