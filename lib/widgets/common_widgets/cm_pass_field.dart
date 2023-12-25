import 'package:flutter/material.dart';
import 'package:auth_app/constants/mycolor.dart';

class CmPassField extends StatelessWidget {
  const CmPassField({super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    const backColor = MyColor.blueSecondary;
    final isObsecure = ValueNotifier<bool>(true);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Linear Color Line
            Container(
              width: .4,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backColor,
              ),
            ),
            const SizedBox(width: 10),
            // textField
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: isObsecure,
                builder: (context, val, _) => TextFormField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  obscureText: val,
                  decoration: InputDecoration(
                    labelText: label,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "m#P52s@ap\$V",
                    suffix: InkWell(
                      onTap: () => isObsecure.value = !val,
                      child:
                          Icon(val ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (val) {
                    bool hasSpecialCharacter = containsSpecialCharacter(val!);
                    bool hasNumber = containsNumber(val);
                    bool hasCapitalLetter = containsCapitalLetter(val);
                    bool hasSmallLetter = containsSmallLetter(val);
                    if (val.isEmpty || val.length < 4) {
                      return 'Plz insert a Password of 4 characters atleast';
                    } else if (!hasSpecialCharacter) {
                      return 'Plz add a Special character [!@#\$%^&*(),.?":{}|<>]';
                    } else if (!hasNumber) {
                      return 'Plz add a NUMBER ( 0-9 )';
                    } else if (!hasCapitalLetter) {
                      return 'Plz add a capital letter ( A-Z )';
                    } else if (!hasSmallLetter) {
                      return 'Plz add a small letter ( a-z )';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  bool containsSpecialCharacter(String str) {
    RegExp specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharacterRegex.hasMatch(str);
  }

  bool containsNumber(String str) {
    RegExp numberRegex = RegExp(r'[0-9]');
    return numberRegex.hasMatch(str);
  }

  bool containsCapitalLetter(String str) {
    RegExp capitalLetterRegex = RegExp(r'[A-Z]');
    return capitalLetterRegex.hasMatch(str);
  }

  bool containsSmallLetter(String str) {
    RegExp smallLetterRegex = RegExp(r'[a-z]');
    return smallLetterRegex.hasMatch(str);
  }
}
