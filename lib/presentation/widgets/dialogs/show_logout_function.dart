import 'package:flutter/material.dart';
import 'package:schools/presentation/widgets/dialogs/logout_dialog_widget.dart';

Future<void> showLogoutFunction(
        {required BuildContext context, required Function() yesAction}) =>
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: LogoutDialogWidget(yes: yesAction)));
