import 'dart:io';

import 'package:book_library/core/config/theme.dart';
import 'package:book_library/core/config/utill/dimension_utill.dart';
import 'package:book_library/di_container.dart';
import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/get_started/get_started_cubit.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_cubit.dart';
import 'package:book_library/feature/presentation/page/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'core/config/screen_style.dart';
import 'core/config/string.dart';
import 'feature/data/model/new_model/new_books.dart';
import 'feature/presentation/cubit/home/home_cubit.dart';
import 'feature/presentation/cubit/new_book_detail/new_book_detail_cubit.dart';
import 'feature/presentation/cubit/new_home/new_home_cubit.dart';
import 'feature/presentation/cubit/read_book/read_book_cubit.dart';

Future<void> main() async{
  init();
  AppStyle.init();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<GetStartedCubit>(
              create: (BuildContext context) => sl<GetStartedCubit>(),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) =>  sl<HomeCubit>(),
            ),
            BlocProvider<SearchResponseCubit>(
              create: (BuildContext context) => sl<SearchResponseCubit>(),
            ),
            BlocProvider<BookDetailCubit>(
              create: (BuildContext context) => sl<BookDetailCubit>(),
            ),
            BlocProvider<NewHomeCubit>(
              create: (BuildContext context) => sl<NewHomeCubit>(),
            ),
            BlocProvider<ReadBookCubit>(
              create: (BuildContext context) => sl<ReadBookCubit>(),
            ),
            BlocProvider<NewBookDetailCubit>(
              create: (BuildContext context) => sl<NewBookDetailCubit>(),
            ),
          ],
     child: const MyApp()),
      );
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
        title: AppString.appName,
        theme: AppTheme.lightTheme,
        home: const GetStarted(),
      );
     }
    );

  }
}

