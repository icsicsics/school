import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_child_item_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';

class FatherChildrenListWidget extends StatefulWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final String token;

  const FatherChildrenListWidget({Key? key, required this.parentHomeResponse,required this.token})
      : super(key: key);

  @override
  State<FatherChildrenListWidget> createState() =>
      _FatherChildrenListWidgetState();
}

class _FatherChildrenListWidgetState extends State<FatherChildrenListWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:const  BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5),
          itemCount: widget.parentHomeResponse.data!.length,
          padding: const EdgeInsets.all(5),
          shrinkWrap: true,
          semanticChildCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return FatherChildItemWidget(
              childName: "${widget.parentHomeResponse.data![index].studentName}",
            onTapStar: () => _onTap(widget.parentHomeResponse.data![index].studentName),
            onTapChild: ()=>_onTapChild(widget.parentHomeResponse.data![index].studentId),
            imageUrl: widget.parentHomeResponse.data![index].getImage != null
                ? widget.parentHomeResponse.data![index].getImage!.mediaUrl!
                : "",
          );
          }
    );
  }

  void _onTap(childName) => showAddPointFunction(
      context: context,
      childName: childName,token: widget.token, classroomId: '79a93948-fb97-4de3-9166-08dafa1996ad');

  _onTapChild(studentId)=>Navigator.push(context, MaterialPageRoute(builder: (_)=> MyChildrenScreen(studentId: studentId,)));
}
