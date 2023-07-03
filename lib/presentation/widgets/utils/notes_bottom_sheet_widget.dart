import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';

class NotesBottomSheetWidget extends StatefulWidget {
  final double height;

  const NotesBottomSheetWidget({
    super.key,
    required this.height,
  });

  @override
  State<NotesBottomSheetWidget> createState() => _NotesBottomSheetWidgetState();
}

class _NotesBottomSheetWidgetState extends State<NotesBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Notes",
                  style: TextStyle(
                    color: Color.fromRGBO(34, 34, 34, 1),
                    letterSpacing: -0.14,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    ImagesPath.closeIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  errorText: null,
                  isDense: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorsManager.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  focusColor: ColorsManager.primaryColor,
                  hintText: "Notes",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: ColorsManager.sameBlack,
                  ),
                ),
                controller: TextEditingController(),
                onChanged: (value1) {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _buildConfirmButton(
                    ImagesPath.positiveIcon, S.of(context).positive),
                SizedBox(
                  width: 40,
                ),
                _buildConfirmButton(
                    ImagesPath.negativeIcon, S.of(context).negative),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton(String image, String text) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: ColorsManager.black,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.13,
          ),
        ),
      ],
    );
  }
}
