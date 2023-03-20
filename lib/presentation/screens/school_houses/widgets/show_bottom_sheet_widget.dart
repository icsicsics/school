import 'package:flutter/material.dart';
import 'package:schools/presentation/screens/school_houses/widgets/bottom_sheet_widget.dart';

Future showBottomSheetWidget({
  required BuildContext context,
  required Widget content,
  double height = 450,
}) async {
  return await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BottomSheetWidget(
              height: height,
              content: content,
            ),
          ));
}
