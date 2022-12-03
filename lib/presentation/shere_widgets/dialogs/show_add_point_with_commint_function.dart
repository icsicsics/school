import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/add_point_with_commint_dialog_widget.dart';

void showAddPointWithCommintFunction(
        {required BuildContext? context,
        required Function() addAction,
        required TextEditingController addController,
        required TextEditingController commintController}) =>
    showDialog(
        barrierDismissible: true,
        context: context!,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: AddPointWithCommintDialogWidget(
              commintController: commintController,
              addAction: addAction,
              addController: addController,
            )));
