import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/my_child_point/my_child_point_screen.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/profile/widgets/child_item_widget.dart';

class FatherOfWidget extends StatelessWidget {
  const FatherOfWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 3, bottom: 3, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BoldTextWidget(
                    text: S.current.fatherOf,
                    fontSize: 16,
                    color: ColorsManager.secondaryColor),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const MyChildrenScreen())),
                            child: const ChildItemWidget());
                      }),
                )
              ],
            )),
      ),
    );
  }
}
