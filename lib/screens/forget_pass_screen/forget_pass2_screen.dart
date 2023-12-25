import 'package:auth_app/widgets/forget_pass_widgets/forget_paas_painter.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page2/signup_p2_body.dart';
import 'package:flutter/material.dart';

class ForgetPass2Screen extends StatefulWidget {
  const ForgetPass2Screen({super.key, required this.contact});
  final String contact;
  @override
  State<ForgetPass2Screen> createState() => _ForgetPass2ScreenState();
}

class _ForgetPass2ScreenState extends State<ForgetPass2Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: ForgetPassPainter(),
        child: SafeArea(
          child: Stack(
            children: [
              // back button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              // soowGood logo
              Positioned(
                top: size.height * .01,
                left: size.width * .2,
                child: Image.asset(
                  'assets/images/common/logo_main.png',
                  width: size.width * .6,
                  height: kToolbarHeight * 1.3,
                  fit: BoxFit.contain,
                ),
              ),
              // otp field, submit button
              SignUpP2Body(contact: widget.contact, userType: 2),
            ],
          ),
        ),
      ),
    );
  }
}
