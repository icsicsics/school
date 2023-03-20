import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          BoldTextWidget(
              text: S.of(context).login,
              fontSize: 25,
              color: ColorsManager.blackColor),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              ImagesPath.logo,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
