import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget content;
  final double height;

  const BottomSheetWidget({
    Key? key,
    required this.content,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 95,
                height: 5,
                decoration: BoxDecoration(
                    color: Color(0xFFCACACA),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                  )
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(child: content)
          ],
        ),
      ),
    );
  }
}
