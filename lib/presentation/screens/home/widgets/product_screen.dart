import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Products",
          style: TextStyle(color: blackfont),
        ),
      ),
    );
  }
}
