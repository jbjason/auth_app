import 'package:auth_app/models/signup_item.dart';

class MyConstant {
  final List<SignUpItem> signupItems = [
    const SignUpItem(img: 'assets/images/doctor.png', title: 'I am a Doctor'),
    const SignUpItem(
        img: 'assets/images/hospitalisation.png', title: 'I am a Patient'),
    const SignUpItem(
        img: 'assets/images/hospitalisation.png', title: 'I am an Agent'),
  ];
}
