import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/student_houses/search_item.dart';
import 'package:schools/presentation/ui/school_houses/widgets/custom_radio_list_tile_widget.dart';

class ValuesBottomSheetWidget extends StatelessWidget {
  final List<SearchItem> values;
  final SearchItem selectedValue;

  const ValuesBottomSheetWidget({
    Key? key,
    required this.values,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => _divider(),
      itemCount: values.length,
      itemBuilder: (context, index) => CustomRadioListTileWidget(
        title: values[index].name,
        id: values[index].id,
        groupValue: selectedValue.id,
        onChange: (value) {
          Navigator.pop(context, values[index]);
        },
      ),
    );
  }

  Widget _divider() => const Divider(
        color: ColorsManager.mediumGrayColor,
        thickness: 0.2,
      );
}
