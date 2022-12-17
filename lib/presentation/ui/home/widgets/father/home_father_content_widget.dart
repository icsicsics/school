import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/home/widgets/father/home_father_details_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';

class HomeFatherContentWidget extends StatelessWidget {
  const HomeFatherContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorsManager.mediumGrayColor)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        ImagesPath.schoolItem,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: MediumTextWidget(
                                color: ColorsManager.blackColor,
                                fontSize: 15,
                                text: "Leen Eiz Deen",
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>MyChildrenScreen())),
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: const BoxDecoration(
                                  color: ColorsManager.whiteColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: ColorsManager.secondaryColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                                  child: const Icon(Icons.star,
                                      color: ColorsManager.yellow, size: 25),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const HomeFatherDetailsWidget(),

          ],
        ),

      ),
    );
  }
}
