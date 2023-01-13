import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class ChildItemWidget extends StatelessWidget {
  final String imageUrl;
  const ChildItemWidget({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 5,
      child: Stack(
        children: [
          itemImageWidget(),
          Align(
            alignment: Alignment.bottomRight,
            child:

            Container(
                height: 30,
                width: 30,
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
                    child:Container(
                      height: 20,
                      width: 20,
                      color: Colors.transparent,
                      child:SvgPicture.asset(ImagesPath.star, height: 18, width: 18),
                    ),
                    ),
                )),

          )
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

  CircleAvatar _buildProfilePlaceHolder() => const CircleAvatar(
    backgroundImage: AssetImage(
      ImagesPath.logo,
    ),
    radius: 50,
  );
}
