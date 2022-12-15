import 'package:flutter/material.dart';

class RPSCustomPainter2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0016667, 0);
    path0.lineTo(size.width * 0.5400000, 0);
    path0.quadraticBezierTo(size.width * 0.7274250, size.height * 0.2860000,
        size.width * 0.7263500, size.height * 0.5014286);
    path0.quadraticBezierTo(size.width * 0.7261917, size.height * 0.7159000,
        size.width * 0.5408333, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class RPSCustomPainter1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.5546750, 0);
    path0.quadraticBezierTo(size.width * 0.7385250, size.height * 0.2943714,
        size.width * 0.7368917, size.height * 0.5042714);
    path0.quadraticBezierTo(size.width * 0.7364750, size.height * 0.7106571,
        size.width * 0.5556167, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
