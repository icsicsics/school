import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/presentation/ui/profile/widgets/camera_gallery_bottom_sheet_widget.dart';

Future<void> openCameraGalleryBottomSheet(
  context,
  final Function(ImageSource) onTap,
) async {
  await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CameraGalleryBottomSheetWidget(
            onTap: onTap,
          )));
}
