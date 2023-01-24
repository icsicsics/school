import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class FatherHeaderWidget extends StatefulWidget {
  final HomeBloc homeBloc;

  const FatherHeaderWidget({Key? key, required this.homeBloc})
      : super(key: key);

  @override
  State<FatherHeaderWidget> createState() => _FatherHeaderWidgetState();
}

class _FatherHeaderWidgetState extends State<FatherHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.secondaryColor,
              ],
              stops: [0.5, 0.8],
            )),
        height: 350,
        child: Stack(
          children: [
            ClipPath(
                clipper: GeneralCurve(),
                child: Container(
                  height: 200,
                  color: ColorsManager.whiteColor,
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BoldTextWidget(
                          text: widget.homeBloc.fatherInfoResponse != FatherInfoResponse()
                              ? widget
                                  .homeBloc.fatherInfoResponse.data!.parentName
                              : "",
                          fontSize: 18,
                          color: ColorsManager.whiteColor),
                     const  SizedBox(height: 6),
                       MediumTextWidget(
                          text:  widget.homeBloc.fatherInfoResponse.data != null
                              ? widget
                              .homeBloc.fatherInfoResponse.data!.phoneNumber
                              : "",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: ColorsManager.blackColor, width: 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset(ImagesPath.avatar,fit: BoxFit.fill)),
                  ),
              ),
            ),
          ],
        ));
  }
}
