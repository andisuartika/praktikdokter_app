import 'package:flutter/material.dart';
import 'package:praktik_dokter/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 10),
            Text(
              'SISTEM INFORMASI \n PRAKTIK DOKTER',
              style: primaryTextStyle.copyWith(
                  color: whiteColor, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
