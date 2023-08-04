import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/presentation/screens/login/login_or_signup.dart';

import '../../main.dart';

Future<void> googleSignIn() async {
  final googleSignIn = GoogleSignIn();

  // ignore: body_might_complete_normally_catch_error
  final googleUser = await googleSignIn.signIn().catchError((onError) {});
  if (googleUser == null) return;

  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  await FirebaseAuth.instance.signInWithCredential(credential);
  navigatorKey.currentState!.popUntil((route) => route.isFirst);

  //there might be platform execption thrown when cancelling the flow ,it fixes itself when running in production
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: black,
        title: const Text(
          "Alert!",
          style: TextStyle(color: white),
        ),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(color: white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: white),
            ),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginOrSignUp();
                }), (route) => false);
              }).catchError((error) {
                log("error : ${error.toString()}");
              });
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: white),
            ),
          ),
        ],
      );
    },
  );
}
