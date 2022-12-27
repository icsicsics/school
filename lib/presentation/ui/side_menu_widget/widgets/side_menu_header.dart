import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class SideMenuHeader extends StatelessWidget {
  final SideMenuBloc bloc;
  final String language;
  const SideMenuHeader({Key? key,required this.bloc,required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: 230,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      ImagesPath.schoolItem,
                    ),
                    radius: 50,
                  ),
                  Padding(
                    padding: language=="en"? const EdgeInsets.only(right: 180): EdgeInsets.only(left: 180),
                    child: IconButton(
                        onPressed: () =>bloc.add(SwitchAccountEvent()) ,
                        icon: const Icon(
                          Icons.supervised_user_circle,
                          color: ColorsManager.secondaryColor,
                          size: 30,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const BoldTextWidget(
                  text: "Eiz el Deen Mahmoud",
                  fontSize: 15,
                  color: ColorsManager.blackColor),
              const SizedBox(
                height: 10,
              ),
              const BoldTextWidget(
                  text: "Math Teacher",
                  fontSize: 12,
                  color: ColorsManager.grayColor),
              const SizedBox(
                height: 10,
              ),
              const BoldTextWidget(
                  text: "Collaboration Home",
                  fontSize: 12,
                  color: ColorsManager.grayColor)
            ],
          ),
        ),
      ),
    );
  }
}
