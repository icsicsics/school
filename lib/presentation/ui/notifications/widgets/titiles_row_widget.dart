import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class TitlesRowWidget extends StatefulWidget {
  const TitlesRowWidget({Key? key}) : super(key: key);

  @override
  State<TitlesRowWidget> createState() => _TitlesRowWidgetState();
}

class _TitlesRowWidgetState extends State<TitlesRowWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.notifications,
                              color: ColorsManager.secondaryColor,
                              size: 26,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            BoldTextWidget(
                                text: "Notifications (2)",
                                fontSize: 17,
                                color: ColorsManager.blackColor)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: ColorsManager.secondaryColor,
                      height: 3,
                      width: MediaQuery.of(context).size.width / 2.5,
                    )
                  ],
                )),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.mail_outline,
                            color: ColorsManager.secondaryColor,
                            size: 26,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BoldTextWidget(
                              text: "Inbox (1)",
                              fontSize: 17,
                              color: ColorsManager.blackColor)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorsManager.secondaryColor,
                    height: 3,
                    width: MediaQuery.of(context).size.width / 2.5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
