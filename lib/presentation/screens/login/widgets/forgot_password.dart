import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/login/login_screen.dart';
import 'package:tryambaka_admin/presentation/widgets/snackbar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kHeight100,
                // const LoginTextField(
                //   hint: "enter your email address",
                //   prefixicon: Icons.email,
                //   inputaction: TextInputAction.done,
                //   inputType: TextInputType.emailAddress,
                //   obsecuretext: false,
                // ),
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
                    labelText: "Enter Email",
                  ),
                ),
                kHeight25,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: emailController.text)
                            .then((value) {
                          alertSnackbar(context, 'check your email');
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const LoginScreen(),
                              )).onError((error, stackTrace) {
                            alertSnackbar(
                                context, 'Error: ${error.toString()}');
                          });
                        });
                      }
                      // Navigator.of(context)
                      //     .push(CupertinoPageRoute(builder: (context) => const MainHome()));
                    },
                    child: Text(
                      "Submit",
                      style: const TextStyle(fontSize: 18, color: white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
