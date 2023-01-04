import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/data/source/remote/repository/splash_repository.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';

class SplashRepositoryImp extends SplashRepository {
  @override
  Future<SplashState> getToken() async {
    SplashState? state;
    GetTokenResponse getTokenResponse = GetTokenResponse();
    try {
      Response response = await DioHelper.getToken();
      getTokenResponse = GetTokenResponse.fromJson(response.data);
      if (getTokenResponse.data!.token!.isNotEmpty) {
        return SplashGetTokenSuccessState(response: getTokenResponse);
      }
    } catch (error) {
      state = SplashGetTokenErrorState(error: getTokenResponse.errorMessage!);
    }
    return state!;
  }
}
