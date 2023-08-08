import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/core/base/internet_connectivity.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/database_helper.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/screens/school_houses/school_houses_screen.dart';
import 'package:schools/presentation/screens/side_menu_widget/side_menu_screen.dart';
import 'package:schools/presentation/widgets/restart_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TeacherHomeScreen extends BaseStatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _TeacherHomeScreenState();
  }
}

class _TeacherHomeScreenState extends BaseState<TeacherHomeScreen>
    with InternetConnectivity {
  HomeBloc get _homeBloc => BlocProvider.of<HomeBloc>(context);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late StreamSubscription<ConnectivityResult> subscription;

  GetTeacherHomeResponse _teacherHomeResponse = GetTeacherHomeResponse();
  TeacherInfoResponse _teacherInfoResponse = TeacherInfoResponse();
  WeatherResponse _weatherResponse = WeatherResponse();
  List<String> _roles = [];
  String language = "";
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetTeacherOfflineDataEvent());
    // _homeBloc.add(GetWeatherEvent());
    _homeBloc.add(GetTeacherHomeEvent(token: ""));
    _homeBloc.add(GetTeacherInfoEvent(token: ""));
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(S.current.offlineMode),
          backgroundColor: Colors.red.withOpacity(0.4),
        ));
        isOffline = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(S.current.onlineMode),
            backgroundColor: Colors.green.withOpacity(0.4)));
        isOffline = false;
      }
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _roles = await SharedPreferencesManager.getRoles() ?? [];
    language = await SharedPreferencesManager.getLanguageCodeHelper() ?? "en";
    // if((await checkInternetConnectivity()) == ConnectivityResult.none ) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(S.current.offlineMode),backgroundColor: Colors.red.withOpacity(0.4),));
    //
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(S.current.onlineMode),backgroundColor: Colors.green.withOpacity(0.4)));
    //
    // }
  }

  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{"1": "${S.of(context).monday}", "2": "${S.of(context).tuesday}", "3":"${S.of(context).wednesday}", "4": "${S.of(context).thursday}", "5": "${S.of(context).friday}", "6": "${S.of(context).saturday}", "7": "${S.of(context).sunday}"}';
    return json.decode(dayData)['${date.weekday}'];
  }

  String monthFormatter(int month) {
    dynamic monthData =
        '{ "1" : "${S.of(context).jan}", "2" : "${S.of(context).feb} ", "3" : "${S.of(context).mar}", "4" : "${S.of(context).apr}", "5" : "${S.of(context).may}", "6" : "${S.of(context).june}", "7" : "${S.of(context).jul}", "8" : "${S.of(context).aug}", "9" : "${S.of(context).sep}", "10" : "${S.of(context).oct}", "11" : "${S.of(context).nov}", "12" : "${S.of(context).dec}" }';
    return json.decode(monthData)['$month'];
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is GetTeacherHomeSuccessState) {
          _teacherHomeResponse = state.response;
        } else if (state is GetWeatherSuccessState) {
          _weatherResponse = state.weather;
        } else if (state is GetTeacherInfoSuccessState) {
          _teacherInfoResponse = state.response;
        } else if (state is GetTeacherInfoFillState) {
        } else if (state is GetWeatherFillState) {
        } else if (state is GetTeacherHomeFillState) {
        } else if (state is SwitchAccountState) {
          _switchAccount();
        } else if (state is ChangeLanguageSuccessState) {
          RestartWidget.restartApp(context);
        } else if (state is GetTeacherOfflineDataSuccessState) {
        } else if (state is GetTeacherOfflineDataErrorState) {}
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _key,
            drawer: SideMenuScreen(
              branchId: _teacherInfoResponse.data?.branchId ?? "",
              meetings: _teacherHomeResponse.data?.meetings ?? [],
            ),
            backgroundColor: ColorsManager.whiteColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 48,
                          left: 16,
                          right: 16,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _key.currentState?.openDrawer();
                                },
                                child: SvgPicture.asset(
                                  ImagesPath.menu,
                                  width: 22,
                                  height: 22,
                                  matchTextDirection: true,
                                  color: Color(0xff3bbbac),
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              if (_roles.length > 1)
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(SwitchAccountEvent());
                                  },
                                  icon: const Icon(
                                    Icons.supervised_user_circle,
                                    color: ColorsManager.secondaryColor,
                                    size: 30,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              _buildSchoolLogo(_teacherHomeResponse
                                      .data?.getLogo?.mediaUrl ??
                                  ""),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                _teacherHomeResponse.data?.schoolName ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorsManager.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.13),
                              ),
                            ],
                          ),
                        ),
                        Positioned.directional(
                          top: 55,
                          end: 16,
                          textDirection: Directionality.of(context),
                          child: InkWell(
                              onTap: () => _changeLanguage(),
                              child: _languageImage()),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsManager.primaryColor,
                          ColorsManager.secondaryColor,
                        ],
                        stops: [0.5, 0.8],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              dateFormatter(DateTime.now()),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsManager.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${DateTime.now().day} ${S.of(context).thOf} ${monthFormatter(DateTime.now().month)} ${DateTime.now().year}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsManager.whiteColor,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.13),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        //Weather
                        /*Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              S.of(context).weather,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsManager.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImagesPath.weatherIcon,
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${((_weatherResponse.main?.temp ?? 0.0) - 273.15).round().toString()} \u2103 ${_weatherResponse.weather?[0].description.toString()}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsManager.whiteColor,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.13),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          S.of(context).teachersPerformance,
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsManager.blackColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.13),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  height: language == "en" ? 320 : 420,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.95),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle,
                                            ),
                                            width: 16,
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            S.of(context).overUser,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(S.of(context).overUserDescription),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                            width: 16,
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            S.of(context).convenientUse,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(S
                                          .of(context)
                                          .convenientUseDescription),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            width: 16,
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            S.of(context).insufficientUse,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(S
                                          .of(context)
                                          .insufficientUseDescription),
                                    ],
                                  ),
                                )),
                          );
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: ColorsManager.primaryColor,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                            showLabels: false,
                            showAxisLine: false,
                            showTicks: false,
                            startAngle: 180,
                            endAngle: 0,
                            minimum: 0,
                            radiusFactor: 1.6,
                            maximum: 99,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 33,
                                color: Color.fromRGBO(243, 154, 74, 1),
                                label: '',
                                labelStyle: GaugeTextStyle(
                                    fontFamily: 'Times', fontSize: 20),
                                startWidth: 50,
                                endWidth: 50,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                              ),
                              GaugeRange(
                                startValue: 33,
                                endValue: 66,
                                color: Color.fromRGBO(59, 187, 172, 1),
                                label: '',
                                labelStyle: GaugeTextStyle(
                                    fontFamily: 'Times', fontSize: 20),
                                startWidth: 50,
                                endWidth: 50,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                              ),
                              GaugeRange(
                                startValue: 66,
                                endValue: 99,
                                color: Color.fromRGBO(249, 65, 68, 1),
                                label: '',
                                labelStyle: GaugeTextStyle(
                                    fontFamily: 'Times', fontSize: 20),
                                startWidth: 50,
                                endWidth: 50,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                  value: _getValue(_teacherHomeResponse
                                          .data?.indicator?.color ??
                                      ""))
                            ])
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLegend(
                          // value: S.of(context).excellent,
                          value: S.of(context).overUser,
                          color: Color.fromRGBO(243, 154, 74, 1),
                        ),
                        _buildLegend(
                          // value: S.of(context).good,
                          value: S.of(context).convenientUse,
                          color: Color.fromRGBO(59, 187, 172, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegend(
                          // value: S.of(context).poor,
                          value: S.of(context).insufficientUse,
                          color: Color.fromRGBO(249, 65, 68, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      _buildHomeCard(
                        image: ImagesPath.classesIcon,
                        title: S.of(context).myClasses,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.home,
                          );
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      _buildHomeCard(
                        image: ImagesPath.housesIcon,
                        title: S.of(context).myHouses,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SchoolHousesScreen(
                                classRoomId:
                                    _teacherInfoResponse.data!.branchId!,
                                isComingFromHome: true,
                                branchId: "",
                                classroomToSectionId: "",
                                teacherId: "",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      _buildHomeCard(
                        image: ImagesPath.mediaIcon,
                        title: S.of(context).myMedia,
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.channels,
                              arguments: {
                                "type": "media",
                                "videos":
                                    _teacherHomeResponse.data?.videos ?? [],
                              });
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      _buildHomeCard(
                        image: ImagesPath.ejabiChannelIcon,
                        title: S.of(context).ejabiChannel,
                        onTap: () {
                          List<ChannelsData> channelsData = [];
                          Navigator.pushNamed(context, AppRoutes.channels,
                              arguments: {
                                "type": "ejabi",
                                "videos": channelsData,
                              });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegend({
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            color: ColorsManager.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildHomeCard({
    required String image,
    required String title,
    required Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  colors: [
                    ColorsManager.whiteColor,
                    Color.fromRGBO(224, 224, 224, 0.31),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.9]),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  spreadRadius: 0,
                  blurRadius: 24,
                  offset: Offset(0, 4), // changes position of shadow
                )
              ]),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(59, 187, 172, 1),
                ),
                child: SvgPicture.asset(
                  image,
                  width: 28,
                  height: 28,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.blackColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getValue(String indicator) {
    if (indicator.toLowerCase() == "red") return 83;
    if (indicator.toLowerCase() == "yellow") return 50;
    if (indicator.toLowerCase() == "green") return 13;
    return 0;
  }

  Widget _buildSchoolLogo(String imageUrl) {
    return imageUrl.isNotEmpty
        ? ClipOval(
            child: Image.network(
              height: 65,
              width: 65,
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : _buildProfilePlaceHolder();
  }

  SizedBox _buildProfilePlaceHolder() {
    return SizedBox(
      height: 65,
      width: 65,
      child: CircleAvatar(
        child: SvgPicture.asset(ImagesPath.avatar,
            fit: BoxFit.cover, height: double.infinity),
      ),
    );
  }

  void _switchAccount() async {
    await SharedPreferencesManager.setIsFather(
        !((await SharedPreferencesManager.getIsFather()) ?? false));
    RestartWidget.restartApp(context);
  }

  Widget _languageImage() {
    return language == "en"
        ? Image.asset(
            ImagesPath.ar,
            height: 30,
            width: 30,
            color: Color(0xff3bbbac),
          )
        : Image.asset(
            ImagesPath.en,
            height: 30,
            width: 30,
            color: Color(0xff3bbbac),
          );
  }

  void _changeLanguage() {
    BlocProvider.of<HomeBloc>(context).add(
      ChangeLanguageEvent(
        language,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}
