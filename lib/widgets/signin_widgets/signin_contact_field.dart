import 'package:auth_app/constants/mycolor.dart';
import 'package:flutter/material.dart';

class SignInContactField extends StatelessWidget {
  const SignInContactField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact No',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(letterSpacing: -.3, color: MyColor.ashhLight),
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: MyColor.skyBlueLight, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: MyColor.skyPrimary, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            filled: true,
            fillColor: MyColor.ashhLight.withOpacity(0.5),
          ),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please try valid credential';
            } else if (val.length < 11) {
              return 'Please provide a valid contact no.';
            } else {
              final intValue = int.tryParse(val);
              if (intValue == null) return "Plz provide a valid contact no";
              return null;
            }
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
