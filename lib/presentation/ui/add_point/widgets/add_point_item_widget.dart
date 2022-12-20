import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class AddPointItemWidget extends StatelessWidget {
  final String childName;
  final Function() onTapStar;
  final Function() onTapChild;

  const AddPointItemWidget(
      {Key? key,
      required this.childName,
      required this.onTapStar,
      required this.onTapChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: onTapChild,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        ImagesPath.schoolItem,
                      ),
                      radius: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorsManager.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: InkWell(
                            onTap: onTapStar,
                            child: const Icon(Icons.star,
                                color: ColorsManager.yellow, size: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          MediumTextWidget(
              text: childName, fontSize: 12, color: ColorsManager.blackColor)
        ],
      ),
    );
  }
}
