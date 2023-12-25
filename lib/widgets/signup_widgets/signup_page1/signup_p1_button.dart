import 'package:auth_app/constants/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpP1Button extends StatefulWidget {
  const SignUpP1Button(
      {super.key,
      required this.controller,
      required this.onSubmit,
      required this.fromKey});
  final TextEditingController controller;
  final Function onSubmit;
  final String fromKey;
  @override
  State<SignUpP1Button> createState() => _SignUpP1ButtonState();
}

class _SignUpP1ButtonState extends State<SignUpP1Button> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ElevatedButton(
            onPressed: _validateContact,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              backgroundColor: MaterialStateProperty.all(MyColor.bluePrimary),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_outlined),
                SizedBox(width: 5),
                Text('Continue')
              ],
            ),
          );
  }

  void _validateContact() {
    if (widget.controller.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please insert your contact no!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (widget.controller.text.trim().length != 11) {
      Fluttertoast.showToast(
        msg: 'Please insert valid contact!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (int.tryParse(widget.controller.text.trim()) == null) {
      Fluttertoast.showToast(
        msg: 'Plz provide a valid contact no',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _onOtpSend();
    }
  }

  void _onOtpSend() async {
    setState(() => _isLoading = true);
    Fluttertoast.showToast(msg: 'OTP sending...');
    await Future.delayed(const Duration(milliseconds: 1000));
    widget.onSubmit();
    setState(() => _isLoading = false);
  }
}
