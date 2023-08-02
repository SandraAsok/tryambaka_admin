import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/home/home_screen.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/forgot_password.dart';
import 'package:tryambaka_admin/presentation/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool passenable = true;
bool isLoading = false;

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      return SafeArea(
          child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight50,
                        Text(
                          'Hello Admin',
                          style: GoogleFonts.sahitya(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                              fontSize: 40,
                              color: black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        kHeight10,
                        Text(
                          'Welcome to Tryambaka Fashion',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                              fontSize: 18,
                              color: black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        kHeight25,
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return "Enter Valid Email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        kHeight10,
                        TextFormField(
                          controller: passwordController,
                          obscureText: passenable,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return "Enter Valid Password with atleast 6 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (passenable) {
                                    passenable = false;
                                  } else {
                                    passenable = true;
                                  }
                                });
                              },
                              icon: Icon(passenable == true
                                  ? Icons.remove_red_eye
                                  : Icons.password),
                            ),
                          ),
                        ),
                        kHeight5,
                        Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                log('Forgot Password');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPassword(),
                                    ));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kHeight25,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 150.0, vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                log('validation success');
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeScreen();
                                    },
                                  ));
                                }).onError((error, stackTrace) {
                                  alertSnackbar(
                                      context, 'Error: ${error.toString()}');
                                  log("Error ${error.toString()}");
                                });
                                isLoading = false;
                              }
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  letterSpacing: .5,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                        kHeight10,
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            Future.delayed(
              const Duration(milliseconds: 100),
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
            );
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        },
      ));
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
