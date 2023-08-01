import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Text(
                  "Tryambaka",
                  style: kHeading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
