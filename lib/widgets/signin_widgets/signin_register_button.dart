import 'package:auth_app/constants/mycolor.dart';
import 'package:auth_app/screens/signup_screen/signup_p1_screen.dart';
import 'package:flutter/material.dart';

class SignInRegisterButton extends StatelessWidget {
  const SignInRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have account yet?',
            style: TextStyle(color: MyColor.ashhLight)),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SignUpP1Screen()));
          },
          child: Row(
            children: [
              const Text(
                "Register now",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: MyColor.skyPrimary),
              ),
              const SizedBox(width: 2),
              Image.asset(
                'assets/icons/arrows.png',
                color: MyColor.ashhLight,
              ),
            ],
          ),
        )
      ],
    );
  }
}
