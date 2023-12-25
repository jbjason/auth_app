import 'package:auth_app/screens/signup_screen/signup_p1_screen.dart';
import 'package:flutter/material.dart';

class SignInRegisterButton extends StatelessWidget {
  const SignInRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have account yet?'),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SignUpP1Screen()));
          },
          child: Row(
            children: [
              const Text(
                "Register now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 2),
              Image.asset('assets/icons/arrows.png'),
            ],
          ),
        )
      ],
    );
  }
}
