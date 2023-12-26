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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/login_back2.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: size.width * .04,
                right: size.width * .04,
                top: size.height * .2,
                child: UnconstrainedBox(
                  child: Container(
                    width: size.width * .92,
                    padding: const EdgeInsets.all(15),
                    //margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/signin_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          offset: Offset(15, 15),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo_main4.png',
                            height: size.height * .2,
                            fit: BoxFit.contain,
                          ),
                          // email textField
                          SignInContactField(controller: _contactController),
                          // pass textField
                          SigninPassField(controller: _passController),
                          // remember-me checkBox & forget-pass button
                          SignInForgetCheckBox(rememberMeBox: _rememberMeBox),
                          const SizedBox(height: 20),
                          // submit button
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SignInButton(onSubmit: onSubmit),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.white),
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
        ),
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
