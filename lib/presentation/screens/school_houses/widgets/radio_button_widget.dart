import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class RadioButtonWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final ValueChanged<T> onChanged;

  const RadioButtonWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.label = "",
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    color: isSelected ? ColorsManager.secondaryColor : ColorsManager.whiteColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color:
                            isSelected ? ColorsManager.secondaryColor : ColorsManager.mediumGrayColor,
                      ),
                    ),
                    color: isSelected ? ColorsManager.secondaryColor : ColorsManager.whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              label.toString(),
              style: TextStyle(
                color: isSelected ?  ColorsManager.secondaryColor : ColorsManager.mediumGrayColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
