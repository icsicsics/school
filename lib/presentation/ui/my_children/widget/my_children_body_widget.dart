import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/ui/my_children/widget/houses_widget.dart';

class MyChildrenBodyWidget extends StatefulWidget {
  final Function () onTapShowPoints;
  const MyChildrenBodyWidget({Key? key,required this.onTapShowPoints}) : super(key: key);

  @override
  State<MyChildrenBodyWidget> createState() => _MyChildrenBodyWidgetState();
}

class _MyChildrenBodyWidgetState extends State<MyChildrenBodyWidget> {
  bool isHomes = false;
  bool selectOptions = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Visibility(
                visible: selectOptions,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed:widget.onTapShowPoints,
                        icon: const Icon(
                          Icons.star,
                          color: ColorsManager.yellow,
                          size: 70,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isHomes = true;
                            selectOptions = false;
                          });
                        },
                        icon: const Icon(
                          Icons.school_sharp,
                          color: ColorsManager.yellow,
                          size: 70,
                        )),
                  ],
                ),
              ),
              Visibility(visible: isHomes, child: const HousesWidget()),
            ],
          ),
        

    );
  }
}
