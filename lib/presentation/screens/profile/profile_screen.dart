import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/core/base_widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/widgets/restart_widget.dart';
import 'package:schools/presentation/screens/notifications/notifications_screen.dart';
import 'package:schools/presentation/screens/profile/widgets/open_camera_or_gallery_bottom_sheet.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_content_widget.dart';

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
  String _imagePath = '';

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
          _navigateToNotificationScreen(state.isNotificationSelected);
        } else if (state is OpenCameraGalleryBottomSheetState) {
          openCameraGalleryBottomSheet(context,(image){
            BlocProvider.of<ProfileBloc>(context)
                .add(SelectProfileImageEvent(source: image));
          });
        } else if (state is SuccessSelectImageState) {
          _onSuccessSelectImage(image: state.image);
          _imagePath=state.image.path;
        } else if (state is SetTeacherProfileImageInShearedPrefranceSuccessState) {
          hideLoading();
          _getProfileImage();
        } else if (state is GetTeacherProfileImageFromShearedPrefranceSuccessState) {
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
          if (_isFather) {
            _bloc.add(GetFatherInfoEvent(token: _token));
          } else {
            _bloc.add(GetTeacherInfoEvent(token: _token));
          }
          // _bloc.add(
          //     SetTeacherProfileImageInShearedPrefranceEvent(image:_imagePath));
        } else if(state is ChangeLanguageSuccessState){
          _restartApp();
        } else if (state is SaveLanguageCodeFailedState){

        }
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

  void _onSuccessSelectImage({required XFile image}) {
    _bloc.add(UploadTeacherImageEvent(xFile: image, token: _token));
    Navigator.pop(context);
  }



  void _getProfileImage() {
    _bloc.add(GetTeacherProfileImageFromShearedPrefranceEvent());
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
              onTap: () => _changeLanguage(),
              child: _languageImage()),
          SizedBox(width: 6,),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: (){
                  _bloc.add(NavigateToNotificationScreenEvent(isNotificationSelected: false));
                },
                child: Icon(
                  Icons.mail,
                  color: Color(0xff3bbbac),
                  size: 30,
                ),
              ),
              Visibility(
                visible: _isFather,
                child: Positioned(
                  top: 8,
                  right: -5,
                  child: InkWell(
                    onTap: (){
                      _bloc.add(NavigateToNotificationScreenEvent(isNotificationSelected: true));
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: ColorsManager.yellow,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).myProfile),
      );

  void _navigateToNotificationScreen(bool isNotificationSelected) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotificationsScreen(
        isNotificationSelected: isNotificationSelected,
      )),);
  void _invokeInit() {
    _bloc.add(GetTeacherProfileImageFromShearedPrefranceEvent());
    _bloc.add(GetIsFatherEvent());
    _bloc.add(GetTokenEvent());
  }

  void _onGetTeacherInfoFallState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetFatherInfoFallState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  Widget _languageImage() => language == "en"
      ? Image.asset(
    ImagesPath.ar,
    height: 35,
    width: 35,
    color: Color(0xff3bbbac),
  )
      : Image.asset(
    ImagesPath.en,
    height: 35,
    width: 35,
    color: Color(0xff3bbbac),

  );

  void _changeLanguage() {
    if (language == "en") {
      _bloc.add(ChangeLanguageEvent("ar"));
    } else {
      _bloc.add(ChangeLanguageEvent("en"));
    }
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }
}
