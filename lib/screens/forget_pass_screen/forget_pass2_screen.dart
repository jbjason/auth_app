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
              //  logo
              Positioned(
                top: -20,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_main4.png',
                    height: kToolbarHeight * 3,
                    fit: BoxFit.contain,
                  ),
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
