import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class ChildItemWidget extends StatelessWidget {
  const ChildItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 5,
      child: Stack(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              ImagesPath.schoolItem,
            ),
            radius: 50,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:

            Container(
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
                        color: ColorsManager.starBackground,
                        borderRadius:
                        BorderRadius.all(Radius.circular(50))),
                    child:Container(
                        height: 20,
                        width: 20,
                        color: Colors.transparent,
                        child: Stack(
                          alignment: Alignment.center,
                          children: const [
                            Icon(Icons.star,
                                color: ColorsManager.whiteColor,
                                size: 25),
                            Icon(Icons.star,
                                color: ColorsManager.yellow, size: 19),
                          ],
                        ),
                      ),
                    ),
                )),

          )
        ],
      ),
    );
  }
}
