import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarIcon extends StatelessWidget {
  final String imagePath;
  final Function() onTap;

  const CustomAppBarIcon(
      {Key? key, required this.imagePath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xffd9d9d9),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(imagePath,matchTextDirection: true),
        ),
      ),
    );
  }
}
