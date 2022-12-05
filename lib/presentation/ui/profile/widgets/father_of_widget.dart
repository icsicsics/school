import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/profile/widgets/child_item_widget.dart';

class FatherOfWidget extends StatelessWidget {
  const FatherOfWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldTextWidget(text: "Father Of ", fontSize: 16, color: ColorsManager.secondaryColor),
              Row(
                children: [
                  ChildItemWidget(),
                  ChildItemWidget(),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
