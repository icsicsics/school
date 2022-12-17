import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/device_info.dart';
import 'package:schools/core/notification_serves.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/themes/app_them.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/bloc/sections/sections_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await DeviceInformation().initPackageInformation();
  await DeviceInformation().initDeviceInformation();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsManager.secondaryColor,
    ),
  );
  NotificationService().initializeNotificationService();
  runApp(const MyApp());
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
          BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
          BlocProvider<VerifyBloc>(create: (BuildContext context) => VerifyBloc()),
          BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
          BlocProvider<NotificationsBloc>(create: (BuildContext context) => NotificationsBloc()),
          BlocProvider<SideMenuBloc>(create: (BuildContext context) => SideMenuBloc()),
          BlocProvider<AddPointBloc>(create: (BuildContext context) => AddPointBloc()),
          BlocProvider<ProfileBloc>(create: (BuildContext context) => ProfileBloc()),
          BlocProvider<SchoolHousesBloc>(create: (BuildContext context) => SchoolHousesBloc()),
          BlocProvider<AboutBloc>(create: (BuildContext context) => AboutBloc()),
          BlocProvider<MyChildrenBloc>(create: (BuildContext context) => MyChildrenBloc()),
          BlocProvider<SectionsBloc>(create: (BuildContext context) => SectionsBloc()),
          BlocProvider<MyChildPointsBloc>(create: (BuildContext context) => MyChildPointsBloc()),
        ],
        child: FutureBuilder<ThemeData>(
          initialData: ThemeData(),
          future: AppTheme().themeDataLight,
          builder: (context, snapshot) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'School',
            theme: snapshot.data,
            home: const SplashScreen(),
          ),
        ));
  }
}
