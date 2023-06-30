import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/awesome/fa_icon.dart';
import 'package:schools/core/utils/awesome/name_icon_mapping.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

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
  String userId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    userId = await SharedPreferencesManager.getUserId() ?? "";

    points = widget.points;
    _list.add(_ChildIconsModel(
        id: "-1", isSelected: true, title: S.current.all, icon: ""));
    _list.add(_ChildIconsModel(
        id: userId, isSelected: false, title: S.current.me, icon: ""));
    for (var element in widget.getTeacherPrinciplByClassroomIdResponse.data!) {
      _list.add(_ChildIconsModel(
          id: element.principleId ?? "",
          title: element.name ?? "",
          isSelected: false,
          icon: element.icon ?? ""));
    }
    // _list.sort((A, B) => A.title
    //     .toString()
    //     .toUpperCase()
    //     .compareTo(B.title.toString().toUpperCase()));

    for (var item in points) {
      filter.add(item);
    }
    BlocProvider.of<MyChildrenBloc>(context).add(MyChildrenFilterEvent(
        filter: filter
          ..sort((A, B) => A.valueId.toString().compareTo(B.valueId ?? ""))));
  }

  @override
  void didUpdateWidget(covariant MyChildrenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // BlocProvider.of<MyChildrenBloc>(context).add(MyChildrenFilterEvent(
    //     filter: filter
    //       ..sort((A, B) => A.valueId.toString().compareTo(B.valueId ?? ""))));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
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
    if (model.id == "-1" || model.id == userId) {
      return InkWell(
        onTap: () {
          _selectItem(model.id, model.title, model.isSelected);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MediumTextWidget(
                  text: model.title, fontSize: 15, color: _getColor(model)),
              if(model.isSelected) SizedBox(width: 4,),
              if (model.isSelected)
                MediumTextWidget(
                    text: "${filter.length}",
                    fontSize: 14,
                    color: _getColor(model))


            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _checkIndexForValues(_ChildIconsModel model) {
    if (model.id == "-1" || model.id == userId) {
      return const SizedBox();
    } else {
      return InkWell(
        onTap: () => _selectItem(model.id, model.title, model.isSelected),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              FaIcon(getIconFromCss(model.icon ?? ""),
                  color: _getColor(model), size: 24),
              if (model.isSelected)
                Positioned(
                  bottom: -16,
                  child: MediumTextWidget(
                      text: "${model.count}",
                      fontSize: 14,
                      color: _getColor(model)),
                )
            ],
          )
          // child: MediumTextWidget(
          //     text: model.title, fontSize: 15, color: _getColor(model))
          ,
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
          filter.clear();
          filter.addAll(points);
        }
      } else if (id == userId) {
        if (element.id == userId && element.isSelected == false) {
          setState(() {
            _list.any((element) => element.isSelected = false);
            element.isSelected = true;
          });
          filter.clear();
          for (var item in points) {
            if (item.createdBy == userId) {
              filter.add(item);
            }
          }
        }
      } else if (id != "-1") {
        if (element.id == "-1" && element.isSelected == true) {
          setState(() {
            element.isSelected = false;
          });
        }
        if (element.id == userId && element.isSelected == true) {
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
                  if (element3.id == filterItem.valueId &&
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
            filter.removeWhere((element) => element.valueId == id);
          }
        }
      }
      if (id == element.id && element.isSelected == false) {
        if (_list.every((element) => element.isSelected == false) &&
            _list.any((element) => element.id == "-1")) {
          for (var element in _list) {
            if (element.id == "-1" && element.isSelected == false) {
              setState(() {
                element.isSelected = true;
              });
            }
            for (var elementInList in points) {
              filter.add(elementInList);
            }
          }
        }
      }
    }

    for (var point in _list) {
      point.count = 0;
      for (var item in filter) {
        if (point.id == item.valueId) {
          point.count++;
        }
      }
    }
    BlocProvider.of<MyChildrenBloc>(context).add(
      MyChildrenFilterEvent(
        filter: filter
          ..sort(
            (A, B) => A.valueId.toString().compareTo(B.valueId ?? ""),
          ),
      ),
    );
  }
}

class _ChildIconsModel {
  String id;
  String title;
  bool isSelected;
  String icon;
  int count = 0;

  _ChildIconsModel({
    required this.id,
    required this.isSelected,
    required this.title,
    required this.icon,
  });
}
