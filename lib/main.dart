import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryambaka_admin/presentation/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tryambaka Admin',
      theme: ThemeData(
        textTheme:
            GoogleFonts.luxuriousRomanTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
