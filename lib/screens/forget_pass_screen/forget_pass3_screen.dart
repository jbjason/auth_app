import 'package:auth_app/widgets/common_widgets/cm_pass_field.dart';
import 'package:auth_app/widgets/forget_pass_widgets/forget_paas_painter.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/constants/mycolor.dart';

class ForgetPass3Screen extends StatefulWidget {
  const ForgetPass3Screen({super.key, required this.contact});
  final String contact;
  @override
  State<ForgetPass3Screen> createState() => _ForgetPass3ScreenState();
}

class _ForgetPass3ScreenState extends State<ForgetPass3Screen> {
  final _formKey = GlobalKey<FormState>();
  final _passFiled = TextEditingController();
  final _confirmPassFiled = TextEditingController();
  final bool _isLoading = false;

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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // title text
                      Text(
                        "Enter New Password",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: MyColor.bluePrimary),
                      ),
                      const SizedBox(height: 10),
                      // subtitle text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Your new password must be different from previously used all passwords.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  letterSpacing: 1.3,
                                  wordSpacing: 1.3,
                                  fontSize: 12,
                                  color: Colors.black38),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // password field
                      CmPassField(controller: _passFiled, label: "Password"),
                      // confirm password field
                      CmPassField(
                        controller: _confirmPassFiled,
                        label: "Confirm Password",
                      ),
                      const SizedBox(height: 15),
                      // submit button
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _onSubmit,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    MyColor.bluePrimary),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              child: const Center(
                                child: Text("Submit"),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    int count = 0;
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => count++ == 3);
  }

  @override
  void dispose() {
    _passFiled.dispose();
    _confirmPassFiled.dispose();
    super.dispose();
  }
}
