import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/config/themes/app_theme.dart';
import 'package:schools/config/utils/constants.dart';
import 'package:schools/config/utils/notification_service.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';
import 'package:schools/di/injector.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/bloc/advisors/advisors_bloc.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
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
import 'package:schools/presentation/widgets/restart_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await initializeDependencies();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsManager.secondaryColor,
    ),
  );
  await NotificationService().initializeNotificationService();
  runApp(
    const RestartWidget(
      MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(create: (context) => injector()),
        BlocProvider<SplashBloc>(create: (context) => injector()),
        BlocProvider<LoginBloc>(create: (BuildContext context) => injector()),
        BlocProvider<VerifyBloc>(create: (BuildContext context) => injector()),
        BlocProvider<HomeBloc>(create: (BuildContext context) => injector()),
        BlocProvider<NotificationsBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<SideMenuBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<StudentHousesBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<ProfileBloc>(create: (BuildContext context) => injector()),
        BlocProvider<SchoolHousesBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<AboutBloc>(create: (BuildContext context) => injector()),
        BlocProvider<MyChildrenBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<AddPointBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<ChannelsBloc>(
            create: (BuildContext context) => injector()),
        BlocProvider<AdvisorsBloc>(
            create: (BuildContext context) => injector()),

      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            theme: AppTheme(state.languageCode).light,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(state.languageCode),
          );
        },
      ),
    );
  }
}
