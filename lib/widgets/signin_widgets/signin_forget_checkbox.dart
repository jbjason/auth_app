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
            value: value,
            onChanged: (val) => rememberMeBox.value = val!,
          ),
        ),
        Text(
          'Remember me',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ForgetPass1Screen()),
            );
          },
          child: Text(
            'Forget your password?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
