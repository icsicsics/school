import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class MyChildrenWidget extends StatefulWidget {
  final List<Points> points;
  final GetTeacherPrinciplByClassroomIdResponse
      getTeacherPrinciplByClassroomIdResponse;

  const MyChildrenWidget(
      {Key? key,
      required this.points,
      required this.getTeacherPrinciplByClassroomIdResponse})
      : super(key: key);

  @override
  State<MyChildrenWidget> createState() => _MyChildrenWidgetState();
}

class _MyChildrenWidgetState extends State<MyChildrenWidget> {
  final Color _selectedColor = ColorsManager.secondaryColor;

  final Color _unselectedColor = ColorsManager.mediumGrayColor;
  List<Points> points = [];
  List<Points> filter = [];
  final List<_ChildIconsModel> _list = [];

  @override
  void initState() {
    points = widget.points;
    _list.add(
        _ChildIconsModel(id: "-1", isSelected: true, title: S.current.all));
    _list
        .add(_ChildIconsModel(id: "2", isSelected: false, title: S.current.me));
    for (var element in widget.getTeacherPrinciplByClassroomIdResponse.data!) {
      _list.add(_ChildIconsModel(
          id: element.id!, title: element.name!, isSelected: false));
    }

    for (var item in points) {
      filter.add(item);
    }
    filter = filter
      ..sort((A, B) => A.principleName
          .toString()
          .toUpperCase()
          .compareTo(B.principleName.toString().toUpperCase()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _list.map((e) => _checkIndexForLabel(e)).toList(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _list.map((e) => _checkIndexForValues(e)).toList(),
            ),
          ],
        ));
  }

  Widget _checkIndexForLabel(_ChildIconsModel model) {
    if (model.id == "-1" || model.id == "2") {
      return InkWell(
        onTap: () => _selectItem(model.id, model.title, model.isSelected),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MediumTextWidget(
              text: model.title, fontSize: 15, color: _getColor(model)),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _checkIndexForValues(_ChildIconsModel model) {
    if (model.id == "-1" || model.id == "2") {
      return const SizedBox();
    } else {
      return InkWell(
        onTap: () => _selectItem(model.id, model.title, model.isSelected),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MediumTextWidget(
              text: model.title, fontSize: 15, color: _getColor(model)),
        ),
      );
    }
  }

  Color _getColor(_ChildIconsModel model) {
    if (model.isSelected) {
      return _selectedColor;
    } else {
      return _unselectedColor;
    }
  }

  void _selectItem(String id, String name, bool isSelected) {
    for (var element in _list) {
      if (id == "-1") {
        if (element.id == "-1" && element.isSelected == false) {
          setState(() {
            _list.any((element) => element.isSelected = false);
            element.isSelected = true;
          });
          for (var filterItem in points) {
            filter.add(filterItem);
          }
        }
      } else if (id != "-1") {
        if (element.id == "-1" && element.isSelected == true) {
          setState(() {
            element.isSelected = false;
          });
        }
        if (element.id == id) {
          if (isSelected == false && id == element.id) {
            filter.clear();
            setState(() {
              element.isSelected = true;
            });
            for (var element3 in _list) {
              if (element3.isSelected == true) {
                for (var filterItem in points) {
                  if (element3.title == filterItem.principleName &&
                      element.isSelected == true) {
                    filter.add(filterItem);
                  }
                }
              }
            }
          } else if (isSelected == true && id == element.id) {
            setState(() {
              element.isSelected = false;
            });
            filter.removeWhere((element) => element.principleName == name);
          }
        }
      }
    }

    BlocProvider.of<MyChildrenBloc>(context).add(MyChildrenFilterEvent(
        filter: filter
          ..sort((A, B) => A.principleName
              .toString()
              .toUpperCase()
              .compareTo(B.principleName.toString().toUpperCase()))));
  }
}

class _ChildIconsModel {
  String id;
  String title;
  bool isSelected;

  _ChildIconsModel(
      {required this.id, required this.isSelected, required this.title});
}
