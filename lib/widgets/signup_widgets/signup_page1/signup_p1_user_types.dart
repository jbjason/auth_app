import 'package:auth_app/constants/myconstants.dart';
import 'package:flutter/material.dart';

class SignUpP1UserTypes extends StatelessWidget {
  const SignUpP1UserTypes(
      {super.key, required this.selectedType, required this.onChangeUserType});
  final int selectedType;
  final Function onChangeUserType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .14,
      child: GridView.builder(
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisExtent: 50,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, i) => Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black12, width: .5),
              ),
              child: Row(
                children: [
                  Image.asset(MyConstant().signupItems[i].img),
                  Expanded(
                    child: Text(
                      MyConstant().signupItems[i].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15,
              right: -15,
              child: Checkbox(
                onChanged: (val) => onChangeUserType(i),
                value: selectedType == i ? true : false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
