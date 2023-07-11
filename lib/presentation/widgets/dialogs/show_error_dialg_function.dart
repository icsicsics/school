import 'package:flutter/material.dart';
import 'package:schools/presentation/widgets/dialogs/error_dialog_widget.dart';

Future<void> showErrorDialogFunction({
  required BuildContext context,
  required String textMessage,
  Function()? onPressed,
  bool isGift = false,
}) =>
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: ErrorDialogWidget(
              textMessage: textMessage,
              isGift: isGift,
              onPressed: onPressed,
            )));
