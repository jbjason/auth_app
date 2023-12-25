import 'package:flutter/material.dart';
import 'package:auth_app/constants/mycolor.dart';

class SigninPassField extends StatelessWidget {
  const SigninPassField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isObsecure = ValueNotifier<bool>(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(letterSpacing: -.3),
        ),
        ValueListenableBuilder(
          valueListenable: isObsecure,
          builder: (context, val, _) => TextFormField(
            textInputAction: TextInputAction.done,
            controller: controller,
            obscureText: val,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: () => isObsecure.value = !val,
                child: Icon(val ? Icons.visibility : Icons.visibility_off),
              ),
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
                borderSide:
                    const BorderSide(color: MyColor.skyPrimary, width: 1),
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
              } else if (val.length < 4) {
                return 'Password should be atleast 4 characters';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
