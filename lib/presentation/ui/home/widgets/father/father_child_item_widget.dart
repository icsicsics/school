import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class FatherChildItemWidget extends StatelessWidget {
final String imageUrl;
  final String childName;
  final Function() onTapStar;
  final Function() onTapChild;

  const FatherChildItemWidget(
      {Key? key,
      required this.childName,
      required this.onTapStar,
      required this.onTapChild,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 126,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(onTap: onTapChild, child: itemImageWidget()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, bottom: 15),
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
          MediumTextWidget(
              text: childName, fontSize: 12, color: ColorsManager.blackColor),
        ],
      ),
    );
  }

  Widget itemImageWidget() {
    return imageUrl.isNotEmpty
        ? ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : _buildProfilePlaceHolder();
  }

  CircleAvatar _buildProfilePlaceHolder() =>  CircleAvatar(
    radius: 50,
    child:  SvgPicture.asset(ImagesPath.avatar,fit: BoxFit.fill),
      );
}
