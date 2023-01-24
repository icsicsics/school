import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/profile/widgets/child_item_widget.dart';

class FatherOfWidget extends StatelessWidget {
  final FatherInfoResponse fatherInfoResponse;
  final String language;

  const FatherOfWidget({Key? key, required this.fatherInfoResponse,required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: fatherInfoResponse.data != null
          ? Container(
              decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, right: 8, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldTextWidget(
                          text: S.current.fatherOf,
                          fontSize: 16,
                          color: ColorsManager.secondaryColor),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                      itemCount: fatherInfoResponse.data!.childrens!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                               MyChildrenScreen(studentId: "${fatherInfoResponse.data!.childrens![index].studentId}", language: language))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChildItemWidget(
                                        imageUrl:
                                            "${fatherInfoResponse.data!.childrens![index].getImage != null ? fatherInfoResponse.data!.childrens![index].getImage!.mediaUrl : ""}", childName: fatherInfoResponse.data!.childrens![index].studentName ?? "",),
                                  ));
                            }),
                      ),

                    ],
                  )),
            )
          : Container(),
    );
  }
}
