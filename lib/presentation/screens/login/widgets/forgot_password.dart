import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_textfields.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/set_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBackground(
          imageurl: 'assets/images/saree_cover2.jpeg',
        ),
        Scaffold(
          backgroundColor: transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kHeight100,
                    const LoginTextField(
                      hint: "enter your email address",
                      prefixicon: Icons.email,
                      inputaction: TextInputAction.done,
                      inputType: TextInputType.emailAddress,
                      obsecuretext: false,
                    ),
                    kHeight25,
                    Container(
                      decoration: BoxDecoration(
                          color: blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Send verification code",
                          style: TextStyle(
                              fontSize: 14,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    kHeight25,
                    Text(
                      "(Please check your e-mail to get the verification code)",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: white.withOpacity(0.6)),
                    ),
                    kHeight50,
                    const LoginTextField(
                      hint: "enter code here",
                      prefixicon: Icons.numbers,
                      inputaction: TextInputAction.done,
                      inputType: TextInputType.phone,
                      obsecuretext: false,
                    ),
                    kHeight25,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Continue Login",
                              style: TextStyle(fontSize: 20, color: white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const SetPassword()));
                            },
                            child: const Text(
                              "Set Password",
                              style: TextStyle(fontSize: 20, color: white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
