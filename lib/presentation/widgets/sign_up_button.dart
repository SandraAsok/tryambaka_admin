import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/presentation/screens/home/home_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key,
      required this.size,
      required this.color,
      required this.text,
      this.widget});

  final Size size;
  final Color color;
  final Widget? widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
      child: Container(
        width: size.width * 0.9,
        height: size.width * 0.13,
        decoration: BoxDecoration(
            border: Border.all(color: black),
            borderRadius: BorderRadius.circular(20),
            color: color),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
