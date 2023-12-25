import 'package:auth_app/constants/mydimens.dart';
import 'package:auth_app/screens/signup_screen/signup_p2_screen.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page1/signup_p1_bottom_buttons.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page1/signup_p1_button.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page1/signup_p1_textfield.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page1/signup_p1_user_types.dart';
import 'package:flutter/material.dart';

class SignUpP1Screen extends StatefulWidget {
  const SignUpP1Screen({super.key});
  @override
  State<SignUpP1Screen> createState() => _SignUpP1ScreenState();
}

class _SignUpP1ScreenState extends State<SignUpP1Screen> {
  final _phnController = TextEditingController();
  int _userType = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: size.height * .45,
            child: Image.asset(
              'assets/images/auth/login_logo.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: const Alignment(0, .4),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: size.height * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: MyDimens.bodyGradient,
                boxShadow: MyDimens.bodyShadow,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // signUp title
                    Text('SignUp',
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      'Hii, Welcome to SoowGood 👋',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black38),
                    ),
                    SizedBox(height: size.height * .02),
                    // gridView items
                    SignUpP1UserTypes(
                      selectedType: _userType,
                      onChangeUserType: _onchangeUserType,
                    ),
                    SizedBox(height: size.height * .01),
                    Text(
                      'Mobile Number',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    // textField
                    SignUpP1TextField(
                      controller: _phnController,
                      fromKey: 'toLogin',
                    ),
                    SizedBox(height: size.height * .02),
                    // signUp button
                    SignUpP1Button(
                      onSubmit: _onSubmit,
                      controller: _phnController,
                      fromKey: 'toSignup',
                    ),
                    const SizedBox(height: 5),
                    // already have account & login text
                    const SignUpP1BottomButtons(),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    // navigation will come here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpP2Screen(
            contact: _phnController.text.trim(), userType: _userType),
      ),
    );
  }

  void _onchangeUserType(int i) {
    _userType = i;
    setState(() {});
  }

  @override
  void dispose() {
    _phnController.dispose();
    super.dispose();
  }
}
