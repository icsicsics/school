import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/ok_dialog_widget.dart';
import 'package:schools/presentation/shere_widgets/ok_dialog_image_widget.dart';

Future showOkDialogImage({
  required BuildContext context,
  required Function() onTap,
  required String dialogMessage,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: OkDialogImageWidget(
          onTap: onTap,
          textMessage: dialogMessage,
          context: context,
        ),
      ),
    );
