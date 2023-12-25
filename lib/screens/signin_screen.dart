import 'package:auth_app/constants/mycolor.dart';
import 'package:auth_app/widgets/signin_widgets/signin_button.dart';
import 'package:auth_app/widgets/signin_widgets/signin_contact_field.dart';
import 'package:auth_app/widgets/signin_widgets/signin_forget_checkbox.dart';
import 'package:auth_app/widgets/signin_widgets/signin_pass_field.dart';
import 'package:auth_app/widgets/signin_widgets/signin_register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _contactController = TextEditingController();
  final _passController = TextEditingController();
  final _rememberMeBox = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.bluePrimary,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: size.height * .45,
            child: SvgPicture.asset(
              'assets/images/auth/bg.svg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: size.height * .3,
            left: size.width * .05,
            width: size.width * .9,
            height: size.height * .5,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 40,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Login to Your Account',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: size.height * .05),
                      // email textField
                      SignInContactField(controller: _contactController),
                      // pass textField
                      SigninPassField(controller: _passController),
                      // remember-me checkBox & forget-pass button
                      SignInForgetCheckBox(rememberMeBox: _rememberMeBox),
                      const SizedBox(height: 15),
                      // submit button
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SignInButton(onSubmit: onSubmit),
                      // already have account & register-now text
                      const SignInRegisterButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    // _goToNextPage(msg);
  }

  @override
  void dispose() {
    _contactController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
