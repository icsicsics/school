import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/points_widget.dart';

class MyChildrenHeaderWidget extends StatefulWidget {
   

   const MyChildrenHeaderWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenHeaderWidget> createState() => _MyChildrenHeaderWidgetState();
}

class _MyChildrenHeaderWidgetState extends State<MyChildrenHeaderWidget> {
  bool isShowPoints=false;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MyChildrenBloc, MyChildrenState>(
  listener: (context, state) {},
  builder: (context, state) {
    if(state is MyChildrenShowPointsState){
      isShowPoints = state.isShowPoints;
    }
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.secondaryColor,
              ],
              stops: [0.5, 0.8],
            )),
        height: 370,
        child: Stack(
          children: [
            Container(
              height: 150,
              decoration:  BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(200.0,15.0),
                      bottomLeft: Radius.elliptical(200.0,15.0))),
            ),
             Visibility(
               visible: isShowPoints,
                 child: const PointsWidget()),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.whiteColor,width: 3),
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: AssetImage(ImagesPath.schoolItem),
                                fit: BoxFit.fill)),
                      ),
              ),
            ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const  [
                        MediumTextWidget(text: "Leen Eiz Deen", fontSize: 20, color: ColorsManager.whiteColor),
                        SizedBox(height: 20,),
                        MediumTextWidget(text: "Interactive Values School", fontSize: 15, color: ColorsManager.whiteColor),
                        MediumTextWidget(text: "5th Grade - Section 4", fontSize: 15, color: ColorsManager.whiteColor),
                        MediumTextWidget(text: "Collaboration Home", fontSize: 15, color: ColorsManager.whiteColor),
                      ]),
                ),
              ),
            ),
          ],
        ),
);
  },
);
  }
}
