import 'package:flutter/material.dart';
import 'package:tryambaka_admin/presentation/screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen())),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Image.asset("assets/images/login_bg.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
