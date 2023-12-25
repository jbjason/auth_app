import 'package:auth_app/constants/mycolor.dart';
import 'package:flutter/material.dart';

class SignUpP2Button extends StatelessWidget {
  const SignUpP2Button({super.key, required this.onSubmit});
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onSubmit(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        backgroundColor: MaterialStateProperty.all(MyColor.bluePrimary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.logout_outlined), Text('Verify & Proceed')],
      ),
    );
  }
}
