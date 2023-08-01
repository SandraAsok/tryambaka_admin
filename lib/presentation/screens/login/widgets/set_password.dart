import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_admin/presentation/screens/login/widgets/login_textfields.dart';
import 'package:tryambaka_admin/presentation/widgets/buttons.dart';

import '../../../../data/colors/colors.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

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
                      "Set New Password",
                      style: normalHeading,
                    ),
                  ),
                  kHeight100,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LoginTextField(
                          hint: "New Password",
                          prefixicon: Icons.lock,
                          inputaction: TextInputAction.next,
                          inputType: TextInputType.visiblePassword,
                          obsecuretext: true,
                        ),
                        kHeight25,
                        LoginTextField(
                          hint: "Confirm Password",
                          prefixicon: Icons.lock,
                          inputaction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                          obsecuretext: true,
                        ),
                        kHeight50,
                        LoginButton(
                          buttontext: "Done",
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
