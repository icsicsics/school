import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/actions_row_widget.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/pin_code_field_widget.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/privcy_and_pulicy.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/send_agin_widget.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/verify_header_widget.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/verify_title_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';

class VerifyContentWidget extends StatefulWidget {
  const VerifyContentWidget({Key? key}) : super(key: key);

  @override
  State<VerifyContentWidget> createState() => _VerifyContentWidgetState();
}

class _VerifyContentWidgetState extends State<VerifyContentWidget> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const VerifyHeaderWidget(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerifyTitleWidget(),
                sizedBox(height: 30),
                PinCodeTextFiledWidget(
                  pinController: pinController,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                sizedBox(height: 10),
                SendAgainWidget(onTap: () {}),
                sizedBox(),
                ActionsRowWidget(
                  changeMobileNumberAction: () {},
                  nextAction: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  },
                ),
                sizedBox(),
                PrivacyAndPolicyWidget(
                  privacyPolicyAction: () {},
                  termOfUseAction: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sizedBox({double height = 35}) => SizedBox(
        height: height,
      );
}
