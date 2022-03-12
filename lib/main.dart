import 'package:flutter/material.dart';
import 'package:yalla_njoom/widgets/custom_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF074785),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(secondary: const Color(0xFFD8EBF7)),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                  color: Color(0xFF074785),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              headline2: const TextStyle(
                  color: Color(0xFF074785),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(child: CustomDialog()),
      ),
    );
  }
}
