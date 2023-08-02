import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/data/functions/functions.dart';
import 'package:tryambaka_admin/presentation/screens/login/login_page.dart';
import 'package:tryambaka_admin/presentation/screens/login/sign_up_screen.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/main_button.dart';

class LoginOrSignUp extends StatelessWidget {
  const LoginOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Stack(
      children: [
        LoginBackground(imageurl: "assets/images/login_bg.jpg"),
        Scaffold(
          backgroundColor: transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight25,
              InkWell(
                onTap: () {
                  googleSignIn();
                },
                hoverColor: grey,
                child: Container(
                  width: size.width * 0.9,
                  height: size.width * 0.13,
                  decoration: BoxDecoration(
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.circular(20),
                      color: black),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png')),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              sbox,
              sbox,
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.4,
                          height: 1,
                          color: grey,
                        ),
                        const Text(
                          'Or',
                          style: TextStyle(color: white),
                        ),
                        Container(
                          width: size.width * 0.4,
                          height: 1,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              sbox,
              MainButton(
                text: 'Continue with Password',
                iconurl:
                    'https://icons.veryicon.com/png/o/internet--web/three-body-project-icon/password-22.png',
                color: grey,
                widget: LoginPage(),
              ),
              sbox,
              sbox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account? ",
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
