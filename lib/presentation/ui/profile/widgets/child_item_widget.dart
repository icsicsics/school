import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/ui/child_details/chils_details_screen.dart';

class ChildItemWidget extends StatelessWidget {
  const ChildItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ChildDetailsScreen()),
          (route) => false),
      child: SizedBox(
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
              child: Container(
                height: MediaQuery.of(context).size.height / 22,
                width: MediaQuery.of(context).size.width / 11,
                decoration: const BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: ColorsManager.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: const Icon(Icons.star,
                        color: ColorsManager.yellow, size: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
