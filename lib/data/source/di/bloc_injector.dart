import 'package:schools/data/source/di/injector.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/bloc/localization/localization/app_localization_cubit.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<LocalizationCubit>(
      () => LocalizationCubit(injector(), injector()));
  injector.registerFactory<SplashBloc>(() => SplashBloc(injector()));
  injector.registerFactory<HomeBloc>(() => HomeBloc(injector(), injector(),injector()));
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  injector.registerFactory<VerifyBloc>(() => VerifyBloc(injector()));
  injector
      .registerFactory<NotificationsBloc>(() => NotificationsBloc(injector(),injector()));
  injector.registerFactory<SideMenuBloc>(() => SideMenuBloc(injector(),injector()));
  injector.registerFactory<StudentHousesBloc>(() => StudentHousesBloc());
  injector.registerFactory<ProfileBloc>(
      () => ProfileBloc(injector(), injector(), injector(),injector(),injector()));
  injector.registerFactory<SchoolHousesBloc>(() => SchoolHousesBloc());
  injector.registerFactory<AboutBloc>(() => AboutBloc());
  injector.registerFactory<MyChildrenBloc>(() => MyChildrenBloc(injector()));

  injector.registerFactory<AddPointBloc>(() => AddPointBloc());
}
