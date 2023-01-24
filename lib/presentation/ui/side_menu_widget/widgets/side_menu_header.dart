import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class SideMenuHeader extends StatelessWidget {
  final SideMenuBloc bloc;
  final String language;
  final bool isFather;

  const SideMenuHeader(
      {Key? key,
      required this.bloc,
      required this.language,
      required this.isFather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: language == "en" ? 190 : 200,
        child: Padding(
          padding: language == "en"
              ? const EdgeInsets.only(left: 25)
              : const EdgeInsets.only(right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bloc.teacherInfoResponse.data != null
                      ? image(bloc.teacherInfoResponse.data!.getImage!.mediaUrl)
                      : const SizedBox(width: 50, height: 80),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () => bloc.add(SwitchAccountEvent()),
                      icon: const Icon(
                        Icons.supervised_user_circle,
                        color: ColorsManager.secondaryColor,
                        size: 30,
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              BoldTextWidget(
                  text: isFather != true
                      ? bloc.teacherInfoResponse.data != null
                          ? bloc.teacherInfoResponse.data!.name
                          : ""
                      : bloc.fatherInfoResponse.data != null
                          ? bloc.fatherInfoResponse.data!.parentName
                          : "",
                  fontSize: 17,
                  color: ColorsManager.blackColor),
              const SizedBox(
                height: 2,
              ),
              BoldTextWidget(
                  text: isFather != true
                      ? bloc.teacherInfoResponse.data != null
                          ? bloc.teacherInfoResponse.data!.email
                          : ""
                      : bloc.fatherInfoResponse.data != null
                          ? bloc.fatherInfoResponse.data!.parentName
                          : "",
                  fontSize: 12,
                  color: ColorsManager.borderColor),
              const SizedBox(
                height: 2,
              ),
              BoldTextWidget(
                  text: isFather != true
                      ? bloc.teacherInfoResponse.data != null
                          ? bloc.teacherInfoResponse.data!.phoneNumber
                          : ""
                      : bloc.fatherInfoResponse.data != null
                          ? bloc.fatherInfoResponse.data!.phoneNumber
                          : "",
                  fontSize: 12,
                  color: ColorsManager.borderColor)
            ],
          ),
        ),
      ),
    );
  }

  Widget image(images) {
    return CircleAvatar(
      radius: 50,
      child: Image.network(
        images ?? "",
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: double.infinity,
            height: 80,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => CircleAvatar(
          radius: 50,
          child: SvgPicture.asset(ImagesPath.avatar, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
