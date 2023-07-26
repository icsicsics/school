import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnBoardingPageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          // Text(
          //   title,
          //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
          //         color: ColorsManager.black,
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //       ),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              description,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorsManager.grayColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
              maxLines: 8,
            ),
          ),
        ],
      ),
    );
  }
}
