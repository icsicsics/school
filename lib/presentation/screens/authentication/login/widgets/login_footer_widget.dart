import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFooterItem(S.of(context).values, ImagesPath.values),
        const SizedBox(width: 8),
        _buildFooterItem(S.of(context).behavior, ImagesPath.behavior),
        const SizedBox(width: 8),
        _buildFooterItem(S.of(context).skills, ImagesPath.skills),
        const SizedBox(width: 8),
      ],
    );
  }

  Row _buildFooterItem(String title, String image) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 5,
        ),
        MediumTextWidget(
          text: title,
          fontSize: 16,
          color: ColorsManager.sameBlack,
        ),
      ],
    );
  }
}
