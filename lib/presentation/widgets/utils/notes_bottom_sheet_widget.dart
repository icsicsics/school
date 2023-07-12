import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/notes/request/create_note_request.dart';
import 'package:schools/data/source/remote/model/notes/response/create_note_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';

class NotesBottomSheetWidget extends StatefulWidget {
  final double height;
  final List<String> guides;
  final String studentId;
  final String teacherId;

  const NotesBottomSheetWidget({
    super.key,
    required this.height,
    required this.guides,
    required this.studentId,
    required this.teacherId,
  });

  @override
  State<NotesBottomSheetWidget> createState() => _NotesBottomSheetWidgetState();
}

class _NotesBottomSheetWidgetState extends State<NotesBottomSheetWidget> {
  TextEditingController textEditingController = TextEditingController();
  String note = "";
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Notes",
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
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  errorText: errorText,
                  isDense: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorsManager.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  focusColor: ColorsManager.primaryColor,
                  hintText: S.of(context).notes,
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: ColorsManager.sameBlack,
                  ),
                ),
                controller: textEditingController,
                onChanged: (value1) {
                  errorText = null;
                  _selectedValue = null;
                  note = value1;
                  setState(() {});
                },
              ),
            ),
            _buildConfirmButton()
            // Row(
            //   children: [
            //     _buildConfirmButton(
            //       ImagesPath.positiveIcon,
            //       S.of(context).positive,
            //       () async {
            //
            //       },
            //     ),
            //     SizedBox(
            //       width: 40,
            //     ),
            //     _buildConfirmButton(
            //       ImagesPath.negativeIcon,
            //       S.of(context).negative,
            //       () async {
            //
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  String? _selectedValue;

  Widget _buildConfirmButton() {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: ColorsManager.grayColor,
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListTile(
                horizontalTitleGap: 0,
                title: Text(
                  S.of(context).positive,
                  style: TextStyle(fontSize: 14),
                ),
                leading: Radio(
                  value: S.of(context).positive,
                  activeColor: ColorsManager.primaryColor,
                  groupValue: _selectedValue,
                  onChanged: (String? value) async {
                    _selectedValue = value ?? "";
                    setState(() {});
                    String token =
                        await SharedPreferencesManager.getTokenDio() ?? "";
                    CreateNoteRequest request = CreateNoteRequest(
                      teacherId: widget.teacherId,
                      guideList: widget.guides,
                      noteDetails: note,
                      noteStatus: true,
                      studentId: widget.studentId,
                    );
                    if (note.isNotEmpty) {
                      try {
                        Response res =
                            await DioHelper.createNote(token, request);
                        if (res.statusCode == 200) {
                          CreateNoteResponse createNoteResponse =
                              CreateNoteResponse.fromJson(res.data);
                          showErrorDialogFunction(
                              context: context,
                              textMessage: createNoteResponse.data ?? "",onPressed: () {
                            Navigator.pop(context);
                          });
                        } else {
                          CreateNoteResponse createNoteResponse =
                              CreateNoteResponse.fromJson(res.data);
                          showErrorDialogFunction(
                              context: context,
                              textMessage:
                                  createNoteResponse.errorMessage ?? "");
                        }
                      } catch (e) {
                        showErrorDialogFunction(
                            context: context,
                            textMessage: "Something went wrong.");
                      }
                    } else {
                      errorText = S.of(context).pleasEnterNote;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                horizontalTitleGap: 0,
                title: Text(
                  S.of(context).negative,
                  style: TextStyle(fontSize: 14),
                ),
                leading: Radio(
                  value: S.of(context).negative,
                  activeColor: ColorsManager.primaryColor,
                  groupValue: _selectedValue,
                  onChanged: (String? value) async {
                    _selectedValue = value ?? "";
                    setState(() {});
                    String token =
                        await SharedPreferencesManager.getTokenDio() ?? "";
                    CreateNoteRequest request = CreateNoteRequest(
                      teacherId: widget.teacherId,
                      guideList: widget.guides,
                      noteDetails: note,
                      noteStatus: false,
                      studentId: widget.studentId,
                    );
                    if (note.isNotEmpty) {
                      try {
                        Response res =
                            await DioHelper.createNote(token, request);
                        if (res.statusCode == 200) {
                          CreateNoteResponse createNoteResponse =
                              CreateNoteResponse.fromJson(res.data);
                          showErrorDialogFunction(
                              context: context,
                              textMessage: createNoteResponse.data ?? "",onPressed: () {
                            Navigator.pop(context);
                          });
                        } else {
                          CreateNoteResponse createNoteResponse =
                              CreateNoteResponse.fromJson(res.data);
                          showErrorDialogFunction(
                              context: context,
                              textMessage:
                                  createNoteResponse.errorMessage ?? "",
                              );
                        }
                      } catch (e) {
                        showErrorDialogFunction(
                            context: context,
                            textMessage: "Something went wrong.");
                      }
                    } else {
                      errorText = "Please enter note";
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget _buildConfirmButton(String image, String text, Function() onTap) {
//   return InkWell(
//     onTap: onTap,
//     child: Row(
//       children: [
//         Image.asset(
//           image,
//           width: 30,
//           height: 30,
//         ),
//         SizedBox(
//           width: 8,
//         ),
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: 14,
//             color: ColorsManager.black,
//             fontWeight: FontWeight.w500,
//             letterSpacing: -0.13,
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
