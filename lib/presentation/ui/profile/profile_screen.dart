import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';
import 'package:schools/presentation/ui/profile/widgets/open_camera_or_gallery_bottom_sheet.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_content_widget.dart';

class ProfileScreen extends BaseStatefulWidget {
  const ProfileScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  ProfileBloc get _bloc => BlocProvider.of<ProfileBloc>(context);
  bool _isFather = false;
  String _profileImage = "";
  TeacherInfoResponse _teacherInfoResponse = TeacherInfoResponse();
  FatherInfoResponse _fatherInfoResponse = FatherInfoResponse();
  String language = '';
  String _token = '';

  @override
  void initState() {
    _invokeInit();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileLoadingState) {
          showLoading();
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
          _bloc.add(GetLanguageEvent());
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        } else if (state is OpenCameraGalleryBottomSheetState) {
          openCameraGalleryBottomSheet(context);
        } else if (state is SuccessSelectImageState) {
          _bloc.add(UploadImageEvent(
              formData: _onSelectImageSuccess(state.image), token: _token));
          _onSelectImageSuccess(state.image);
        } else if (state is SuccessUploadProfileImageState) {
          hideLoading();
          _getProfileImage();
        } else if (state is SuccessGetProfileImageState) {
          _profileImage = state.image;
        } else if (state is GetTokenState) {
          _token = state.token;
          if (_isFather) {
            _bloc.add(GetFatherInfoEvent(token: state.token));
          } else {
            _bloc.add(GetTeacherInfoEvent(token: state.token));
          }
        } else if (state is GetTeacherInfoSuccessState) {
          _teacherInfoResponse = state.response;
          hideLoading();
          _bloc.add(UploadProfileImageEvent(image: state.response.data!.getImage!.mediaUrl!));
        } else if (state is GetTeacherInfoFillState) {
          hideLoading();
          _onGetTeacherInfoFallState(state.error);
        } else if (state is GetFatherInfoSuccessState) {
          _fatherInfoResponse = state.response;
          hideLoading();
        } else if (state is GetFatherInfoFillState) {
          hideLoading();
          _onGetFatherInfoFallState(state.error);
        } else if (state is GetLanguageSuccessState) {
          language = state.language;
        } else if (state is TeacherChangePhotoSuccessState) {
          // _uploadProfileImage(image: state.image);
        } else if (state is TeacherChangePhotoFillState) {}
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.backgroundColor,
            appBar: _appBar(),
            body: ProfileContentWidget(
              fatherInfoResponse: _fatherInfoResponse,
              teacherInfoResponse: _teacherInfoResponse,
              bloc: _bloc,
              isFather: _isFather,
              profileImage: _profileImage,
              language: language,
              classroomSectionStudentsId:
                  "f2894667-39a5-42b6-c7df-08dafd8025b3",
              classroomId: "79a93948-fb97-4de3-9166-08dafa1996ad",
            ));
      },
    );
  }


  void _getProfileImage() {
    _bloc.add(GetProfileImageEvent());
    Navigator.pop(context);
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25),
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () => _bloc.add(NavigateToNotificationScreenEvent()),
            child: SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: _isFather == false,
                        child: const Icon(
                          Icons.mail,
                          color: ColorsManager.secondaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Visibility(
                          visible: _isFather,
                          child: const Icon(
                            Icons.mail,
                            color: ColorsManager.secondaryColor,
                            size: 25,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Visibility(
                          visible: _isFather,
                          child: const Icon(
                            Icons.notifications,
                            color: ColorsManager.yellow,
                            size: 24,
                          ),
                        )),
                  ],
                )),
          ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).myProfile),
      );

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _invokeInit() {
    _bloc.add(GetProfileImageEvent());
    _bloc.add(GetIsFatherEvent());
    _bloc.add(GetTokenEvent());
  }

  void _onGetTeacherInfoFallState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetFatherInfoFallState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  FormData _onSelectImageSuccess(XFile image) {
    FormData formData = FormData();
    formData.files.add(MapEntry('file',
        MultipartFile.fromString("png&${image.path}", filename: image.name)));
    return formData;
  }
}
