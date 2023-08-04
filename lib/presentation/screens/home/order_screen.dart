import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Orders",
          style: TextStyle(color: blackfont),
        ),
      ),
    );
  }
}
