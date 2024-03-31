import 'package:book_library/core/config/theme.dart';
import 'package:book_library/core/config/utill/dimension_utill.dart';
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/get_started/get_started_cubit.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_cubit.dart';
import 'package:book_library/feature/presentation/page/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/screen_style.dart';
import 'feature/presentation/cubit/home/home_cubit.dart';
import 'feature/presentation/cubit/new_home/new_home_cubit.dart';
import 'feature/presentation/cubit/read_book/read_book_cubit.dart';

void main() {
  AppStyle.init();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<GetStartedCubit>(
              create: (BuildContext context) => GetStartedCubit(),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
            ),
            BlocProvider<SearchResponseCubit>(
              create: (BuildContext context) => SearchResponseCubit(),
            ),
            BlocProvider<BookDetailCubit>(
              create: (BuildContext context) => BookDetailCubit(),
            ),
            BlocProvider<NewHomeCubit>(
              create: (BuildContext context) => NewHomeCubit(),
            ),
            BlocProvider<ReadBookCubit>(
              create: (BuildContext context) => ReadBookCubit(),
            ),
          ],
     child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  LayoutBuilder(
     builder: (context , constraints){
       SizerUtil.setScreenSize(constraints);
       return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Library',
        theme: AppTheme.lightTheme,
        home: const GetStarted(),
      );
     }
    );

  }
}

