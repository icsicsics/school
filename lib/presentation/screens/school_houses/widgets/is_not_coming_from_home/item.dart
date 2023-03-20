import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class ItemWidget extends StatelessWidget {
  final String childName;
  final String imagePath;
  final Function() onTapStar;
  final Function() onTapChild;

  const ItemWidget(
      {Key? key,
      required this.childName,
      required this.onTapStar,
      required this.onTapChild,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(onTap: onTapChild, child: image(imagePath)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 13),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: ColorsManager.starBackground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: InkWell(
                              onTap: onTapStar,
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.transparent,
                                child: SvgPicture.asset(ImagesPath.star,
                                    height: 25, width: 25),
                              ),
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 110,
            child: MediumTextWidget(
              text: childName,
              fontSize: 12,
              color: ColorsManager.blackColor,
            ),
          )
        ],
      ),
    );
  }

  Widget image(images) {
    return ClipOval(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image.network(
          images,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: double.infinity,
              height: 80,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => CircleAvatar(
            radius: 50,
            child: SvgPicture.asset(ImagesPath.avatar, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
