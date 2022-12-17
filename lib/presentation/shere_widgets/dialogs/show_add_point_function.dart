import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/add_point_with_commint_dialog_widget.dart';

Future<void> showAddPointFunction(
        {required BuildContext context,
        required Function() addAction,
        required String childName,
        required TextEditingController commentController}) =>
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: AddPointDialogWidget(
              addAction: addAction,
              childName: childName,
              commentController: commentController,
            )));
