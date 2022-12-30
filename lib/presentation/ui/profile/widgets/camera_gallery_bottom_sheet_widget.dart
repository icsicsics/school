import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class CameraGalleryBottomSheetWidget extends StatelessWidget {
  const CameraGalleryBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          textWithIconWidget(
              icon:Icons.camera_alt_rounded,
              text:"Camera",
              onTap: () {
                BlocProvider.of<ProfileBloc>(context).add(
                     SelectProfileImageEvent(source: ImageSource.camera));
              },
              context: context),
          const SizedBox(height: 12),
          const Divider(height: 2, thickness: 1),
          const SizedBox(height: 12),
          textWithIconWidget(
              icon: Icons.camera,
              text: "Gallery",
              onTap: () {
                BlocProvider.of<ProfileBloc>(context).add(
                     SelectProfileImageEvent(source: ImageSource.gallery));
              },
              context: context)
        ],
      ),
    );
  }

  Widget textWithIconWidget(
      {required IconData icon,
      required String text,
      required Function() onTap,
      required BuildContext context}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          MediumTextWidget(text: text, fontSize: 14, color: ColorsManager.mediumGrayColor)
        ],
      ),
    );
  }
}
