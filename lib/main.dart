import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:karigar/pages/splash_screen.dart';


void main() {
  runApp(const KarigarApp());
}

class KarigarApp extends StatelessWidget {
  const KarigarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karigar',
      home: const SplashScreen(),
    );
  }
}
