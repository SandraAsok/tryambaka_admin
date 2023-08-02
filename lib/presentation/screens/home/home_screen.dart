import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Home",
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
