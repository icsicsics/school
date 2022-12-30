
import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/profile/widgets/camera_gallery_bottom_sheet_widget.dart';

Future<void> openCameraGalleryBottomSheet(context) async {
  await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const CameraGalleryBottomSheetWidget()
      ));
}
