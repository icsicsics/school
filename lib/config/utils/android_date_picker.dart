import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

Future<DateTime?> androidDatePicker({
  required BuildContext context,
  required DateTime selectedDate,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 20),
    builder: (context,child) {
      return Theme(data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: ColorsManager.primaryColor
        )
      ), child: child!);
    }
  );
}
