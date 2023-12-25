import 'package:auth_app/constants/mycolor.dart';
import 'package:auth_app/constants/mydimens.dart';
import 'package:auth_app/screens/forget_pass_screen/forget_pass3_screen.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page2/signup_p2_button.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class SignUpP2Body extends StatefulWidget {
  const SignUpP2Body(
      {super.key, required this.contact, required this.userType});
  final String contact;
  final int userType;
  @override
  State<SignUpP2Body> createState() => _SignUpP2BodyState();
}

class _SignUpP2BodyState extends State<SignUpP2Body> {
  final otpController = OtpFieldController();
  String otp = '';
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: const Alignment(0, .4),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: size.height * .6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: MyDimens.bodyGradient,
          boxShadow: MyDimens.bodyShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // img
                Image.asset(
                  'assets/images/auth/v_code.jpg',
                  height: size.height * .2,
                ),
                const SizedBox(height: 15),
                // verify & sub texts
                Text(
                  'Get Your Code',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: MyColor.bluePrimary),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please enter the 4 digit code that send to your phone  \"${widget.contact}\"",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      letterSpacing: 1.3,
                      fontSize: 12,
                      wordSpacing: 1.3,
                      color: Colors.black38),
                ),
                const SizedBox(height: 20),
                // otp textField
                OTPTextField(
                  controller: otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (val) => otp = val,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive any code?  ",
                        style: TextStyle(color: Colors.black38)),
                    GestureDetector(
                      onTap: _onSubmit,
                      child: const Text(" Resend"),
                    ),
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    children: [],
                  ),
                ),
                const SizedBox(height: 10),
                // submit button
                _isLoading
                    ? const CircularProgressIndicator()
                    : SignUpP2Button(onSubmit: _onSubmit),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    _goToNextPage();
  }

  void _goToNextPage() {
    // userType==2 means, we come from forget Password page
    if (widget.userType == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ForgetPass3Screen(contact: widget.contact),
        ),
      );
    } else {}
  }
}
