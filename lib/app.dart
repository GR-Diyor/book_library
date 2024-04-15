import 'package:flutter/material.dart';
import 'core/config/string.dart';
import 'core/config/theme.dart';
import 'core/config/utill/dimension_utill.dart';
import 'feature/presentation/page/get_started.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  LayoutBuilder(
        builder: (context , constraints){
          SizerUtil.setScreenSize(constraints);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: AppTheme.lightTheme,
            home: const GetStarted(),
          );
        }
    );

  }
}
