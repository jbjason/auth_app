import 'package:auth_app/constants/mycolor.dart';
import 'package:flutter/material.dart';

class SignUpP1TextField extends StatelessWidget {
  const SignUpP1TextField(
      {super.key, required this.controller, required this.fromKey});
  final TextEditingController controller;
  final String fromKey;

  @override
  Widget build(BuildContext context) {
    final isLogin = fromKey.contains('toLogin');
    return TextField(
      textInputAction: TextInputAction.done,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        isDense: true,
        hintText: '018-000-00000',
        hintStyle: const TextStyle(color: Colors.black12, letterSpacing: .3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: MyColor.skyBlueLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: MyColor.skyPrimary, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        filled: true,
        fillColor: isLogin ? MyColor.ashhLight.withOpacity(0.5) : Colors.white,
      ),
    );
  }
}
