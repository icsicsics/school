import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/card_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';

class HomeListWidget extends StatefulWidget {
  const HomeListWidget({Key? key}) : super(key: key);

  @override
  State<HomeListWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController addController = TextEditingController();



    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5),
        itemCount: 20,
        padding: const EdgeInsets.all(5),
        shrinkWrap: false,
        semanticChildCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const AddPointScreen()));
                if (index == 0) {
                  showAddPointFunction(
                      context: context,
                      addAction: () {
                        Navigator.pop(context);
                      },
                      addController: addController);
                }
              },
              child: const CardWidget(
                section: "Section A",
                imagePath: ImagesPath.schoolItem,
                grade: "Grade 2",
              ),
            ),
          );
        },
      ),
    );
  }
}
