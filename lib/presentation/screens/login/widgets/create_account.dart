import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_textfields.dart';
import 'package:tryambaka_admin/presentation/widgets/buttons.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBackground(
          imageurl: 'assets/images/saree_cover.jpeg',
        ),
        Scaffold(
          backgroundColor: transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight100,
                  kHeight50,
                  Center(
                    child: Text(
                      "Create New Account",
                      style: normalHeading,
                    ),
                  ),
                  kHeight50,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LoginTextField(
                          hint: "Enter Name",
                          prefixicon: Icons.person,
                          inputaction: TextInputAction.next,
                          inputType: TextInputType.name,
                          obsecuretext: false,
                        ),
                        kHeight25,
                        LoginTextField(
                          hint: "Enter email address",
                          prefixicon: Icons.email,
                          inputaction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
                          obsecuretext: false,
                        ),
                        kHeight25,
                        LoginTextField(
                          hint: "Set Password",
                          prefixicon: Icons.lock,
                          inputaction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                          obsecuretext: true,
                        ),
                        kHeight50,
                        CreateAccountButton(
                          buttontext: "Create",
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
