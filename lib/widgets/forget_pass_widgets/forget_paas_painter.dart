import 'package:flutter/material.dart';
import 'package:auth_app/constants/mycolor.dart';

class ForgetPassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final paint = Paint()..color = MyColor.bluePrimary;
    final path = Path();
    path.lineTo(0, h * .3);

    //path.cubicTo(w * .2, h * .15, w * .8, h * .15, w, h * .3);
    path.cubicTo(0, h * .03, w, h * .3, w, h * .04);
    path.lineTo(w, 0);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, MyColor.bluePrimary, 10, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
