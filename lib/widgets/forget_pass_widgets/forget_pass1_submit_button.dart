import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auth_app/constants/mycolor.dart';

class ForgetPass1SubmitButton extends StatelessWidget {
  const ForgetPass1SubmitButton(
      {super.key, required this.contactField, required this.onSubmit});
  final TextEditingController contactField;
  final Function onSubmit;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    if (contactField.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please insert your contact no!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (contactField.text.trim().length != 11) {
      Fluttertoast.showToast(
        msg: 'Please insert valid contact!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (int.tryParse(contactField.text.trim()) == null) {
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
      onSubmit();
    }
  }
}
