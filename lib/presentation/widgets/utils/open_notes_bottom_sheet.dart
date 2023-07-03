import 'package:flutter/material.dart';
import 'package:schools/presentation/screens/advisors/widgets/request_meeting_bottom_sheet_widget.dart';
import 'package:schools/presentation/screens/school_houses/widgets/show_bottom_sheet_widget.dart';
import 'package:schools/presentation/widgets/utils/notes_bottom_sheet_widget.dart';

Future openNotesBottomSheet({
  required BuildContext context,
  required double height,
}) async {
  await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: NotesBottomSheetWidget(
          height: height,
        ),
      ));
}
