import 'package:flutter/material.dart';
import 'package:schools/core/utils/themes/app_them.dart';
import 'package:schools/presentation/ui/splash/splash_screen.dart';

void main() {
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
    return FutureBuilder<ThemeData>(
      initialData: ThemeData(),
      future: AppTheme().themeDataLight,
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School',
        theme: snapshot.data,
        home: const SplashScreen(),
      ),
    );
  }
}

