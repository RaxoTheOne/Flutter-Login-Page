import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig appConfig = await AppConfig.getInstance();
  runApp(MyApp(appConfig: appConfig));
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  MyApp({required this.appConfig});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(loginUseCase: appConfig.loginUseCase),
    );
  }
}
