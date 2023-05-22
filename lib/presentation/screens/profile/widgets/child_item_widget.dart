import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';

class ChildItemWidget extends StatelessWidget {
  final String imageUrl;
  final String childName;
  bool isStartVisible;

   ChildItemWidget({
    Key? key,
    required this.imageUrl,
    required this.childName,
    this.isStartVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width / 5,
          child: Stack(
            children: [
              SizedBox(height: 70, width: 70, child: itemImageWidget()),
              isStartVisible ? Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: ColorsManager.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Colors.transparent,
                          child: SvgPicture.asset(ImagesPath.star,
                              height: 18, width: 18),
                        ),
                      ),
                    )),
              ):const SizedBox.shrink()
            ],
          ),
        ),
        const SizedBox(height: 7),
        BoldTextWidget(
            text: childName, fontSize: 14, color: ColorsManager.grayColor),
      ],
    );
  }

  Widget itemImageWidget() {
    return imageUrl.isNotEmpty
        ? ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : _buildProfilePlaceHolder();
  }

  CircleAvatar _buildProfilePlaceHolder() => CircleAvatar(
        child: SvgPicture.asset(ImagesPath.avatar, fit: BoxFit.fill),
      );
}
