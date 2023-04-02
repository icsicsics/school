import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';

class CardWidget extends StatelessWidget {
  final TeacherInfoResponse teacherInfoResponse;
  final String imagePath;
  final String id;
  final String grade;
  final String section;
  final double height;
  final double width;

  const CardWidget(
      {Key? key,
      required this.teacherInfoResponse,
      required this.imagePath,
      required this.id,
      this.height = 200,
      this.width = 130,
      required this.grade,
      required this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: ColorsManager.grayColor),
          color: ColorsManager.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                image(imagePath),
                buildCameraIcon(context)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            BoldTextWidget(
                text: grade,
                fontSize: 13,
                color: ColorsManager.welcomeGryColor),
            const SizedBox(height: 5),
            BoldTextWidget(
                text: section,
                fontSize: 13,
                color: ColorsManager.welcomeGryColor),
          ],
        ));
  }

  Widget  buildCameraIcon(BuildContext context) {
    for(var item in teacherInfoResponse.data?.classroomsTeacher  ?? []){
      if(item.classroomToSectionId == id) {
        return  Positioned(
          bottom: 8,
          right: 12,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<HomeBloc>(context).add(
                  OpenCameraGalleryBottomSheetEvent(
                      classroomToSectionId: id));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.camera_alt,
                    color: ColorsManager.yellow, size: 18),
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }
    return const SizedBox.shrink();
  }

  Widget image(images) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8), topLeft: Radius.circular(8)),
      child: Image.network(
        images,
        fit: BoxFit.cover,
        height: 120,
        width: double.infinity,
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
        errorBuilder: (context, error, stackTrace) => ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
          child: Image.asset(
            ImagesPath.schoolItem,
            fit: BoxFit.fill,
            height: 130,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
