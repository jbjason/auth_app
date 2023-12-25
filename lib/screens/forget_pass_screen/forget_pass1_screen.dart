import 'package:auth_app/screens/forget_pass_screen/forget_pass2_screen.dart';
import 'package:auth_app/widgets/forget_pass_widgets/forget_paas_painter.dart';
import 'package:auth_app/widgets/forget_pass_widgets/forget_pass1_submit_button.dart';
import 'package:auth_app/widgets/signup_widgets/signup_page1/signup_p1_textfield.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/constants/mycolor.dart';

class ForgetPass1Screen extends StatefulWidget {
  const ForgetPass1Screen({super.key});
  @override
  State<ForgetPass1Screen> createState() => _ForgetPass1ScreenState();
}

class _ForgetPass1ScreenState extends State<ForgetPass1Screen> {
  final _contactField = TextEditingController();
  bool _isLoading = false;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // title text
                    Text(
                      'Enter your contact number',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: MyColor.bluePrimary),
                    ),
                    const SizedBox(height: 10),
                    // subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "☹️ You kidding! lost your Password, really?\nAnyway I'm letting you slide this time huh.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            letterSpacing: 1.3,
                            fontSize: 12,
                            wordSpacing: 1.3,
                            color: Colors.black38),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // contact field
                    SignUpP1TextField(
                      controller: _contactField,
                      fromKey: 'toForget',
                    ),
                    SizedBox(height: size.height * .02),
                    // signUp button
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ForgetPass1SubmitButton(
                            contactField: _contactField,
                            onSubmit: _onSubmit,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    setState(() => _isLoading = true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ForgetPass2Screen(contact: _contactField.text.trim()),
      ),
    );

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _contactField.dispose();
    super.dispose();
  }
}
