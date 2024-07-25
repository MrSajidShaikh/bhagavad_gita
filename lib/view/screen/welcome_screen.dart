import 'dart:async';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: const Alignment(0, 0.8),
          children: [
            Expanded(
              child: Image.asset(
                'assets/img/bg_img.jpg',
                height: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            const Text(
              'जीवन न बीते कल में है\nऔर न ही आने वाले कल में है\nजीवन जो भी है वो इसी पल में है',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
