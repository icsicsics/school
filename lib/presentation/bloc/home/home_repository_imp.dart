import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:schools/data/source/local/database_helper.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_data.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/parent_offline/parent_offline_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/teacher_home_data.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_data.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_offline/teacher_offline_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/data/source/remote/repository/home_repository.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';

class HomeRepositoryImp extends BaseHomeRepository {
  @override
  Future<HomeState> getTeacherHome(String token) async {
    HomeState? state;
    GetTeacherHomeResponse getTeacherHomeResponse = GetTeacherHomeResponse();
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      getTeacherHomeResponse.data =
          (await databaseHelper.getTeacherOfflineData())
                  .teacherOfflineData
                  ?.teacherHomePage ??
              TeacherHomeData();
      getTeacherHomeResponse.errorCode = 200;
      getTeacherHomeResponse.errorMessage = "Success";
      state = GetTeacherHomeSuccessState(response: getTeacherHomeResponse);
    } else {
      try {
        Response response = await DioHelper.getTeacherHome(token);
        getTeacherHomeResponse = GetTeacherHomeResponse.fromJson(response.data);
        if (getTeacherHomeResponse.data != null) {
          return GetTeacherHomeSuccessState(response: getTeacherHomeResponse);
        }
      } catch (error) {
        state = GetTeacherHomeFillState(
            error: getTeacherHomeResponse.errorMessage ?? "Error");
      }
    }

    return state!;
  }

  @override
  Future<HomeState> getParentHome(String token) async {
    HomeState? state;
    GetChildrenByParentResponse getChildrenByParentResponse =
        GetChildrenByParentResponse();
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      getChildrenByParentResponse.data =
          (await databaseHelper.getParentOfflineData())
                  .parentOfflineData
                  ?.children ??
              [];
      print((await databaseHelper.getParentOfflineData()).parentOfflineData?.fatherInfoData?.parentName);
      print((await databaseHelper.getParentOfflineData()).parentOfflineData?.fatherInfoData?.phoneNumber);
      print((await databaseHelper.getParentOfflineData()).parentOfflineData?.fatherInfoData?.childrens);
      getChildrenByParentResponse.errorCode = 200;
      getChildrenByParentResponse.errorMessage = "Success";
      state = GetParentHomeSuccessState(response: getChildrenByParentResponse);
    } else {
      try {
        Response response = await DioHelper.getChildrenByParent(token);
        getChildrenByParentResponse =
            GetChildrenByParentResponse.fromJson(response.data);
        if (getChildrenByParentResponse.data != null) {
          state =
              GetParentHomeSuccessState(response: getChildrenByParentResponse);
        }
      } catch (error) {
        state = GetParentHomeFillState(
            error: getChildrenByParentResponse.errorMessage ?? "Error");
      }
    }
    return state!;
  }

  @override
  Future<HomeState> getFatherInfo(String token) async {
    HomeState? state;
    FatherInfoResponse fatherInfoResponse = FatherInfoResponse();
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      fatherInfoResponse.data = (await databaseHelper.getParentOfflineData())
              .parentOfflineData
              ?.fatherInfoData ??
          FatherInfoData();
      fatherInfoResponse.errorCode = 200;
      fatherInfoResponse.errorMessage = "Success";
      state = GetFatherInfoSuccessState(response: fatherInfoResponse);
    } else {
      try {
        Response response = await DioHelper.getFatherInfo(token);
        fatherInfoResponse = FatherInfoResponse.fromJson(response.data);
        if (fatherInfoResponse.data != null) {
          return GetFatherInfoSuccessState(response: fatherInfoResponse);
        }
      } catch (error) {
        state = GetFatherInfoFillState(
            error: fatherInfoResponse.errorMessage ?? "Error");
      }
    }
    return state ?? GetFatherInfoFillState(error: "Error");
  }

  @override
  Future<HomeState> getTeacherInfo(String token) async {
    HomeState? state;
    TeacherInfoResponse teacherInfoResponse = TeacherInfoResponse();
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      teacherInfoResponse.data = (await databaseHelper.getTeacherOfflineData())
              .teacherOfflineData
              ?.teacherInfo ??
          TeacherInfoData();
      teacherInfoResponse.errorCode = 200;
      teacherInfoResponse.errorMessage = "Success";
      state = GetTeacherInfoSuccessState(response: teacherInfoResponse);
    } else {
      try {
        Response response = await DioHelper.getTeacherInfo(token);
        teacherInfoResponse = TeacherInfoResponse.fromJson(response.data);
        if (teacherInfoResponse.data != null) {
          return GetTeacherInfoSuccessState(response: teacherInfoResponse);
        }
      } catch (error) {
        state = GetTeacherInfoFillState(
            error: teacherInfoResponse.errorMessage ?? "Error");
      }
    }
    return state!;
  }

  @override
  Future<HomeState> getWeather(late, long, lan) async {
    HomeState? state;
    WeatherResponse weather = WeatherResponse();
    try {
      Response response = await DioHelper.getWeather(late, long, lan);
      weather = WeatherResponse.fromJson(response.data);
      if (weather.id != null) {
        return GetWeatherSuccessState(weather: weather);
      }
    } catch (error) {
      state = GetWeatherFillState(error: "Error");
    }
    return state!;
  }

  @override
  Future<HomeState> getTeacherOffline(
      String token, bool language, int search) async {
    HomeState? state;
    TeacherOfflineResponse teacherOfflineResponse = TeacherOfflineResponse();
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    try {
      Response response =
          await DioHelper.getTeacherOffline(token, language, search);
      teacherOfflineResponse = TeacherOfflineResponse.fromJson(response.data);
      if (teacherOfflineResponse.teacherOfflineData != null) {
        databaseHelper.insertTeacherOfflineData(teacherOfflineResponse);
        return GetTeacherOfflineDataSuccessState(
            response: teacherOfflineResponse);
      }
    } catch (error) {
      state = GetTeacherOfflineDataErrorState(
          error: teacherOfflineResponse.errorMessage ?? "Error");
    }
    return state ?? GetTeacherOfflineDataErrorState(error: "Error");
  }

  @override
  Future<HomeState> getParentOffline(String token, bool language, int search) async {
    HomeState? state;
    ParentOfflineResponse parentOfflineResponse = ParentOfflineResponse();
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    try {
      Response response =
          await DioHelper.getParentOffline(token, language, search);
      parentOfflineResponse = ParentOfflineResponse.fromJson(response.data);
      if (parentOfflineResponse.parentOfflineData != null) {
        databaseHelper.insertParentOfflineData(parentOfflineResponse);
        return GetParentOfflineDataSuccessState(
            response: parentOfflineResponse);
      }
    } catch (error) {
      state = GetParentOfflineDataErrorState(
          error: parentOfflineResponse.errorMessage ?? "Error");
    }
    return state ?? GetParentOfflineDataErrorState(error: "Error");
  }



}
