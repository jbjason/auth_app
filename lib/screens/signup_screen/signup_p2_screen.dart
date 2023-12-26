import 'package:auth_app/widgets/signup_widgets/signup_page2/signup_p2_body.dart';
import 'package:flutter/material.dart';

class SignUpP2Screen extends StatelessWidget {
  const SignUpP2Screen(
      {super.key, required this.contact, required this.userType});
  final String contact;
  final int userType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: size.height * .45,
                child: Image.asset(
                  'assets/images/login_back1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              SignUpP2Body(contact: contact, userType: userType),
            ],
          ),
        ),
      ),
    );
  }
}
