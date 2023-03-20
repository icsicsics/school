import 'package:flutter/material.dart';
import 'package:schools/presentation/widgets/dialogs/ok_dialog_widget.dart';

Future showOkDialog({
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
        child: OkDialogWidget(
          onTap: onTap,
          dialogMessage: dialogMessage,
        ),
      ),
    );
