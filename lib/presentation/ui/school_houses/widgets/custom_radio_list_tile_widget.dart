import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/presentation/ui/school_houses/widgets/radio_button_widget.dart';

class CustomRadioListTileWidget extends StatelessWidget {
  final int groupValue;
  final String title;
  final int id;
  final Function(dynamic) onChange;

  const CustomRadioListTileWidget({
    Key? key,
    required this.title,
    required this.id,
    required this.groupValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(id),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            const Expanded(child: SizedBox()),
            RadioButtonWidget(
              value: id,
              groupValue: groupValue,
              onChanged: onChange,
            )
          ],
        ),
      ),
    );
  }
}
