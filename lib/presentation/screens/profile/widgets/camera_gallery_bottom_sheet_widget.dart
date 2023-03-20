import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class CameraGalleryBottomSheetWidget extends StatelessWidget {
  final Function(ImageSource) onTap;

  const CameraGalleryBottomSheetWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.clear))
            ],
          ),
          const SizedBox(height: 5),
          textWithIconWidget(
              icon: Icons.camera_alt_rounded,
              text: S.of(context).camera,
              onTap: (){
                onTap(ImageSource.camera);
              },
              // onTap: () => BlocProvider.of<ProfileBloc>(context)
              //     .add(SelectProfileImageEvent(source: ImageSource.camera)),
              context: context),
          const SizedBox(height: 12),
          const Divider(height: 2, thickness: 1),
          const SizedBox(height: 12),
          textWithIconWidget(
              icon: Icons.camera,
              text: S.of(context).gallery,
              onTap: (){
                onTap(ImageSource.gallery);
              },
              // onTap: () => BlocProvider.of<ProfileBloc>(context)
              //     .add(SelectProfileImageEvent(source: ImageSource.gallery)),
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
          MediumTextWidget(
              text: text, fontSize: 14, color: ColorsManager.mediumGrayColor)
        ],
      ),
    );
  }
}
