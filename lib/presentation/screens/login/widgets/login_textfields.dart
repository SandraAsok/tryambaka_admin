import 'package:flutter/material.dart';

import '../../../../data/colors/colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.hint,
    required this.prefixicon,
    required this.inputaction,
    required this.obsecuretext,
    required this.inputType,
  });

  final String hint;
  final IconData prefixicon;
  final TextInputAction inputaction;
  final TextInputType inputType;
  final bool obsecuretext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[600]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        obscureText: obsecuretext,
        cursorColor: white,
        keyboardType: inputType,
        style: const TextStyle(fontSize: 22, color: white),
        textInputAction: inputaction,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            prefixicon,
            color: grey,
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 22, color: grey),
        ),
      ),
    );
  }
}
