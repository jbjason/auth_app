import 'package:auth_app/constants/mycolor.dart';
import 'package:auth_app/screens/forget_pass_screen/forget_pass1_screen.dart';
import 'package:flutter/material.dart';

class SignInForgetCheckBox extends StatelessWidget {
  const SignInForgetCheckBox({super.key, required this.rememberMeBox});
  final ValueNotifier rememberMeBox;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // checkBox
        ValueListenableBuilder(
          valueListenable: rememberMeBox,
          builder: (context, value, _) => Checkbox(
            checkColor: Colors.white,
            value: value,
            onChanged: (val) => rememberMeBox.value = val!,
          ),
        ),
        const Text('Remember me', style: TextStyle(color: MyColor.ashhLight)),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ForgetPass1Screen()),
            );
          },
          child: const Text(
            'Forget your password?',
            style: TextStyle(
                color: Colors.cyan,
                letterSpacing: -1,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
