import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final ProfileBloc bloc;
  final String profileImage;

  const ProfileHeaderWidget(
      {Key? key, required this.bloc, required this.profileImage})
      : super(key: key);

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
            Container(
              height: 150,
              decoration: const BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(200.0, 15.0),
                      bottomLeft: Radius.elliptical(200.0, 15.0))),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      BoldTextWidget(
                          text: "Eiz el Deen Mahmoud",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      BoldTextWidget(
                          text: "Father & Guardian",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  Center(
                      child: SizedBox(
                    width: 150,
                    height: 150,
                    child: profileImageWidget(),
                  )),
                  GestureDetector(
                    onTap: () => bloc.add(OpenCameraGalleryBottomSheetEvent()),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.5, left: 125.0),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorsManager.whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.camera_alt,
                                color: ColorsManager.yellow, size: 27),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget profileImageWidget() {
    return profileImage.isNotEmpty
        ? ClipOval(
            child: Image.file(
              File(profileImage),
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : SizedBox(
            width: 150,
            height: 150,
            child:  CircleAvatar(
              child:  SvgPicture.asset(ImagesPath.avatar,fit: BoxFit.cover,height: double.infinity),
            ),
          );
  }

  CircleAvatar _buildProfilePlaceHolder() => CircleAvatar(
        child:  SvgPicture.asset(ImagesPath.avatar,fit: BoxFit.cover),
      );
}
