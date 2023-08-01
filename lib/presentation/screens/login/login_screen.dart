import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/create_account.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/forgot_password.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_textfields.dart';
import 'package:tryambaka_admin/presentation/widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBackground(
          imageurl: 'assets/images/login_bg.jpg',
        ),
        Scaffold(
          backgroundColor: transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight100,
                  Center(
                    child: Text(
                      "App Name",
                      style: kHeading,
                    ),
                  ),
                  kHeight100,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const LoginTextField(
                          hint: "Email",
                          prefixicon: Icons.email,
                          inputaction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
                          obsecuretext: false,
                        ),
                        kHeight25,
                        const LoginTextField(
                          hint: "Password",
                          prefixicon: Icons.lock,
                          inputaction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                          obsecuretext: true,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => const ForgotPassword(),
                                fullscreenDialog: true));
                          },
                          child: const Text(
                            "forgot password?",
                            style: TextStyle(fontSize: 18, color: white),
                          ),
                        ),
                        kHeight100,
                        const LoginButton(
                          buttontext: "Login",
                        ),
                        kHeight50,
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()));
                              },
                              child: const Text(
                                "Create New Account !",
                                style: TextStyle(fontSize: 20, color: white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
