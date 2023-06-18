import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class RequestMeetingBottomSheetWidget extends StatefulWidget {
  final double height;

  const RequestMeetingBottomSheetWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<RequestMeetingBottomSheetWidget> createState() =>
      _RequestMeetingBottomSheetWidgetState();
}

class _RequestMeetingBottomSheetWidgetState
    extends State<RequestMeetingBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Advisors",
                  style: TextStyle(
                    color: Color.fromRGBO(34, 34, 34, 1),
                    letterSpacing: -0.14,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    ImagesPath.closeIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
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
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Name of Advisor",
                            style: TextStyle(
                              color: Color.fromRGBO(34, 34, 34, 1),
                              letterSpacing: -0.13,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  "Date & Time",
                  style: TextStyle(
                    color: Color.fromRGBO(34, 34, 34, 1),
                    letterSpacing: -0.14,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                SvgPicture.asset(ImagesPath.calendar),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(59, 187, 172, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
