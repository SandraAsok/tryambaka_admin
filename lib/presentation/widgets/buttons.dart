import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.buttontext,
  });

  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25)),
      child: TextButton(
        onPressed: () {
          // Navigator.of(context)
          //     .push(CupertinoPageRoute(builder: (context) => const MainHome()));
        },
        child: Text(
          buttontext,
          style: const TextStyle(fontSize: 18, color: white),
        ),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
    required this.buttontext,
  });

  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          buttontext,
          style: const TextStyle(fontSize: 18, color: white),
        ),
      ),
    );
  }
}
