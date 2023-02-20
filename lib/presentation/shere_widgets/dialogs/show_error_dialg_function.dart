import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/error_dialog_widget.dart';

Future<void> showErrorDialogFunction(
    {required BuildContext context, required String textMessage,bool isGift=false}) =>
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: ErrorDialogWidget(
              textMessage: textMessage,
              isGift:isGift,
            )));
