import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/di/injector.dart';
import 'package:schools/domain/usecases/get_phone_number_use_case.dart';
import 'package:schools/domain/usecases/get_refresh_token_use_case.dart';
import 'package:schools/domain/usecases/set_refresh_token_use_case.dart';
import 'package:schools/domain/usecases/set_token_use_case.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
        "REQUEST [${' '}${options.method}${' '}] ${' '} URL: ${options.baseUrl + options.path} ${options.data} \n ${options.headers} \n ${options.queryParameters.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "RESPONSE [${' '}${response.statusCode}${' '}]${'\n'}${jsonEncode(response.data)}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // if(err.response?.statusCode == 401){
    //   Response response = await DioHelper.refreshToken((await GetPhoneNumberUseCase(injector())()?? ""), (await GetRefreshTokenUseCase(injector())()?? ""));
    //   GetTokenResponse getTokenResponse = GetTokenResponse.fromJson(response.data);
    //   await SetTokenUseCase(injector())(token: getTokenResponse.data!.token!.accessToken ?? "");
    //   await SetRefreshTokenUseCase(injector())(refreshToken: getTokenResponse.data!.token!.refreshToken ?? "");
    //   await _retry(err.requestOptions);
    // }
    debugPrint(
        "ERROR [${' '}${err.response?.statusCode}${' '}]${'\n'} error meesage =>"
        " ${err.response.toString()} ${'\n'} error header => ");
    return super.onError(err, handler);
  }


  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
