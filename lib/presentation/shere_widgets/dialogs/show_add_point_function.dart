import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/add_point_with_commint_dialog_widget.dart';

Future showAddPointFunction(
        {required BuildContext context,
        required String childName,
        required String token,
        required String classroomId}) =>
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: AddPointDialogWidget(
              childName: childName,
              classroomId: classroomId,
              token: token,
            )));
