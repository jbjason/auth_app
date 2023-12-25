import 'package:auth_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class SignUpP1BottomButtons extends StatelessWidget {
  const SignUpP1BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SignInScreen()));
          },
          child: Row(
            children: [
              const Text(
                "login now",
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
