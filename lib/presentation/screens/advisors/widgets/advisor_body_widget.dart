import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';

class AdvisorBodyWidget extends StatelessWidget {
  final Advisor advisor;

  const AdvisorBodyWidget({
    Key? key,
    required this.advisor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        ImagesPath.advisorPlaceHolder,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          advisor.groupName ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(34, 34, 34, 1),
                            fontSize: 14,
                            letterSpacing: -0.13,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "8:00 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(152, 152, 152, 1),
                            fontSize: 14,
                            letterSpacing: -0.13,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Title is here",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(243, 154, 74, 1),
                        fontSize: 14,
                        letterSpacing: -0.13,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Description is here",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(152, 152, 152, 1),
                        fontSize: 14,
                        letterSpacing: -0.13,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            color: Color.fromRGBO(217, 217, 217, 1),
            height: 1.2,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
