import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/screens/authentication/verify/widgets/submit_button_widget.dart';
import 'package:schools/presentation/screens/authentication/verify/widgets/pin_code_field_widget.dart';
import 'package:schools/presentation/screens/authentication/verify/widgets/send_agin_widget.dart';
import 'package:schools/presentation/screens/authentication/verify/widgets/verify_title_widget.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';

class VerifyContentWidget extends StatefulWidget {
  final String language;
  final String phoneNumber;
  final List<String> roles;

  const VerifyContentWidget({
    Key? key,
    required this.language,
    required this.phoneNumber,
    required this.roles,
  }) : super(key: key);

  @override
  State<VerifyContentWidget> createState() => _VerifyContentWidgetState();
}

class _VerifyContentWidgetState extends State<VerifyContentWidget> {
  TextEditingController pinController = TextEditingController();
  String _selectedRole = "Teacher";

  @override
  Widget build(BuildContext context) {
    print(_selectedRole);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerifyTitleWidget(),
                sizedBox(height: 30),
                PinCodeTextFiledWidget(
                  pinController: pinController,
                  onChanged: (value) {},
                  language: widget.language,
                ),
                sizedBox(height: 30),
                SubmitButtonWidget(
                  submitAction: () async {
                    if (_selectedRole == "Teacher") {
                      await SharedPreferencesManager.setIsFather(false);
                    } else {
                      await SharedPreferencesManager.setIsFather(true);
                    }
                    BlocProvider.of<VerifyBloc>(context).add(VerifyCodeEvent(
                        phoneNumber: widget.phoneNumber,
                        verifyCode: pinController.text.trim()));
                  },
                ),
                sizedBox(height: 20),
                SendAgainWidget(onTap: () {}),
                sizedBox(),
                _buildRoles(widget.roles)
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

  _buildRoles(List<String> roles) {
    if (roles.length <= 1) {
      return Container();
    }

    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: ColorsManager.grayColor,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox(), flex: 2),
            Expanded(
              flex: 5,
              child: ListTile(
                horizontalTitleGap: 0,
                title: const Text('Teacher'),
                leading: Radio(
                  value: "Teacher",
                  activeColor: ColorsManager.primaryColor,
                  groupValue: _selectedRole,
                  onChanged: (String? value) {
                    _selectedRole = value ?? "";
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListTile(
                horizontalTitleGap: 0,
                title: const Text('Parent'),
                leading: Radio(
                  value: "Parent",
                  activeColor: ColorsManager.primaryColor,
                  groupValue: _selectedRole,
                  onChanged: (String? value) {
                    _selectedRole = value ?? "";
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
