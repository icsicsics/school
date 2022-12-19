import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyChildBodyWidget extends StatefulWidget {
  final MyChildPointsBloc bloc;

  const MyChildBodyWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MyChildBodyWidget> createState() => _MyChildBodyWidgetState();
}

class _MyChildBodyWidgetState extends State<MyChildBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => widget.bloc.add(OpenPointScreenEvent()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagesPath.points,height: 80,),
              const SizedBox(height: 15),
            const   BoldTextWidget(
                  text: "Points",
                  fontSize: 15,
                  color: ColorsManager.borderColor ),
            ],
          ),
        ),
        InkWell(
          onTap: () => widget.bloc.add(NavigateToHomeScreenEvent()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              SvgPicture.asset(ImagesPath.school,height: 80,),
             const  SizedBox(height: 15),
             const  BoldTextWidget(
                  text: " School Homes",
                  fontSize: 15,
                  color: ColorsManager.borderColor),
            ],
          ),
        ),
      ],
    );
  }
}
