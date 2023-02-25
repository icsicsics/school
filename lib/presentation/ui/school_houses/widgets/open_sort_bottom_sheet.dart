import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/student_houses/search_item.dart';
import 'package:schools/presentation/ui/school_houses/widgets/show_bottom_sheet_widget.dart';
import 'package:schools/presentation/ui/school_houses/widgets/values_bottom_sheet_widget.dart';

Future openValuesBottomSheet({
  required BuildContext context,
  required List<SearchItem> values,
  required SearchItem selectedValue,
  required double height,
  required void Function(SearchItem value) selectValueEvent,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: ValuesBottomSheetWidget(
      values: values,
      selectedValue: selectedValue,
    ),
  ).then(
    (value) {
      if (value != null) {
        selectValueEvent(value as SearchItem);
      }
    },
  );
}
