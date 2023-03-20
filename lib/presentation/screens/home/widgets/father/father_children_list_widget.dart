import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/screens/home/widgets/father/father_child_item_widget.dart';
import 'package:schools/presentation/screens/my_children/my_children_screen.dart';

class FatherChildrenListWidget extends StatefulWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final String token;
  final String language;
  final String classroomSectionStudentsId;
  final String classroomId;
  final Function() onCreatePointSuccess;

  const FatherChildrenListWidget(
      {Key? key,
      required this.parentHomeResponse,
      required this.token,
      required this.language,
      required this.classroomSectionStudentsId,
      required this.classroomId,required this.onCreatePointSuccess})
      : super(key: key);

  @override
  State<FatherChildrenListWidget> createState() =>
      _FatherChildrenListWidgetState();
}

class _FatherChildrenListWidgetState extends State<FatherChildrenListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5),
        itemCount: widget.parentHomeResponse.data!.length,
        padding: const EdgeInsets.all(5),
        shrinkWrap: true,
        semanticChildCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return FatherChildItemWidget(
            childName: "${widget.parentHomeResponse.data![index].studentName}",
            onTapStar: () => _onTap(
                classroomSectionStudentsId: widget.classroomSectionStudentsId,
                classroomId: widget.classroomId,
                childName:
                    widget.parentHomeResponse.data![index].studentName ?? "",
                studentId:
                    widget.parentHomeResponse.data![index].studentId ?? ""),
            onTapChild: () =>
                _onTapChild(widget.parentHomeResponse.data![index].studentId),
            imageUrl: widget.parentHomeResponse.data![index].getImage!.mediaUrl!,
          );
        });
  }

  void _onTap(
          {required String childName,
          required String classroomId,
          required String classroomSectionStudentsId,
          required String studentId}) =>
      showAddPointFunction(
          isParent: true,
          context: context,
          childName: childName,
          token: widget.token,
          classroomId: classroomId,
          classroomSectionStudentsId: classroomSectionStudentsId,
          studentId: studentId, onCreatePointSuccess: widget.onCreatePointSuccess);

  _onTapChild(studentId) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => MyChildrenScreen(
                studentId: studentId,
                language: widget.language,
                isParent: true,
                classroomSectionStudentsId: widget.classroomSectionStudentsId,
                classroomId: widget.classroomId,
              )));
}
