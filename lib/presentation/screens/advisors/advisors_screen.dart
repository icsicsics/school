import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/screens/advisors/utils/open_request_meeting_bottom_sheet.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_widget.dart';
import 'package:schools/presentation/widgets/utils/open_notes_bottom_sheet.dart';

class AdvisorsScreen extends StatefulWidget {
  const AdvisorsScreen({Key? key}) : super(key: key);

  @override
  State<AdvisorsScreen> createState() => _AdvisorsScreenState();
}

class _AdvisorsScreenState extends State<AdvisorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: InkWell(
        onTap: () {
          openRequestMeetingBottomSheet(
            context: context,
            height: 350,
          );
          // openNotesBottomSheet(
          //   context: context,
          //   height: 350,
          // );
        },
        child: Container(
            height: 40,
            width: 145,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(59, 187, 172, 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 24,
                    spreadRadius: 0,
                    color: Color.fromRGBO(59, 187, 172, 0.5),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagesPath.calendar,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  S.of(context).requestMeeting,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    letterSpacing: -0.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return AdvisorWidget();
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Advisor Record',
        style: TextStyle(
          color: Color.fromRGBO(23, 23, 23, 1),
        ),
      ),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          ImagesPath.arrowBackIcon,
          fit: BoxFit.scaleDown,
          width: 20,
          height: 20,
          matchTextDirection: true,
          color: Colors.black,
        ),
      ),
      foregroundColor: Colors.white,
    );
  }
}
