import 'package:flutter/material.dart';

class RPSCustomPainterLeft2 extends CustomClipper<Path> {
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

class RPSCustomPainterLeft1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.5546750, 0);
    path0.quadraticBezierTo(size.width * 0.7385250, size.height * 0.2943714, size.width * 0.7368917, size.height * 0.5042714);
    path0.quadraticBezierTo(size.width * 0.7364750, size.height * 0.7106571, size.width * 0.5556167, size.height);
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



class RPSCustomPainterRight2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width,0);
    path0.lineTo(size.width*0.5000000,0);
    path0.quadraticBezierTo(size.width*0.3779083,size.height*0.2244857,size.width*0.3741667,size.height*0.4971429);
    path0.quadraticBezierTo(size.width*0.3742000,size.height*0.7084143,size.width*0.4986083,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class RPSCustomPainterRight1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width,0);
    path0.lineTo(size.width*0.4566667,0);
    path0.quadraticBezierTo(size.width*0.3325000,size.height*0.2199286,size.width*0.3325000,size.height*0.4985714);
    path0.quadraticBezierTo(size.width*0.3349167,size.height*0.7113571,size.width*0.4575000,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

