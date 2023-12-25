import 'package:auth_app/models/signup_item.dart';

class MyConstant {
  final List<SignUpItem> signupItems = [
    const SignUpItem(
        img: 'assets/images/auth/doctor.png', title: 'I am a Doctor'),
    const SignUpItem(
        img: 'assets/images/auth/hospitalisation.png', title: 'I am a Patient'),
    const SignUpItem(
        img: 'assets/images/auth/hospitalisation.png', title: 'I am an Agent'),
  ];
}
