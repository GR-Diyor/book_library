import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/get_started/get_started_cubit.dart';
import 'package:book_library/feature/presentation/cubit/home/home_cubit.dart';
import 'package:book_library/feature/presentation/cubit/new_book_detail/new_book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/new_home/new_home_cubit.dart';
import 'package:book_library/feature/presentation/cubit/read_book/read_book_cubit.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Provider
  sl.registerFactory(() => GetStartedCubit());
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => BookDetailCubit());
  sl.registerFactory(() => SearchResponseCubit());
  sl.registerFactory(() => NewHomeCubit());
  sl.registerFactory(() => ReadBookCubit());
  sl.registerFactory(() => NewBookDetailCubit());


  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());

}