import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class VerifyHeaderWidget extends StatelessWidget {
  const VerifyHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          ColorsManager.primaryColor,
          ColorsManager.secondaryColor,
        ],
        stops: [0.5, 0.8],
      )),
      height: 180,
      child: Align(
        alignment: Alignment.center,
        child:   Image.asset(ImagesPath.logo,color: Colors.white,height: 150,)
      ),
    );
  }
}
