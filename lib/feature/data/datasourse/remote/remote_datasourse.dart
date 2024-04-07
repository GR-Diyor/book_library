import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/config/string.dart';

class RemoteDataSource {

  RemoteDataSource() {
    dio = Dio();
    dio
      ..options.baseUrl = AppString.base
      ..options.connectTimeout = const Duration(seconds: 30000).inSeconds
      ..options.receiveTimeout = const Duration(seconds: 30000).inSeconds
      ..httpClientAdapter
      ..options.headers = AppString.header;
  }


  late final Dio dio;


  ///category
   Future<Either<String,String>> getCategory(String api) async {
    try {
      Response r = await dio.get(
        AppString.base+api+AppString.keyApi
      );
      //print((r.data));
      if (r.statusCode == 200) {
        return Right(jsonEncode(r.data));
      }
      return Left("Server exception:${r.statusCode}");
    } catch (e) {
      return Left(e.toString());
    }
  }

  ///book with id
  Future<Either<String,String>> getBook({required String api,required String id}) async {
    try {
      Response r = await dio.get(
          AppString.base+api+id+AppString.keyApi
      );
      // id    "9780593629888"
      if (r.statusCode == 200) {
        return Right(jsonEncode(r.data));
      }
      return Left("Server exception:${r.statusCode}");
    } catch (e) {
      return Left(e.toString());
    }
  }


  ///search book
  Future<Either<String,String>> getSearchBook({required String text}) async {
    try {
      Response r = await dio.get(
          AppString.base+AppString.searchListApi1+text+AppString.searchListApi2+AppString.keyApi
      );
      if (r.statusCode == 200) {
        return Right(jsonEncode(r.data));
      }
      return Left("Server exception:${r.statusCode}");
    } catch (e) {
      return Left(e.toString());
    }
  }




  Future<Either<String,String>> getNewBookList(String api) async {
    try {
      Response r = await dio.get(
          AppString.newBase+api
      );
    //  print((r.data));
      if (r.statusCode == 200) {
        return Right(jsonEncode(r.data));
      }
      return Left("Server exception:${r.statusCode}");
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String,String>> getNewSearchBook({required String text}) async {
    try {
      Response r = await dio.get(
          AppString.newBase+AppString.newSearchBook+text
      );
      // print((r.data));
      if (r.statusCode == 200) {
        return Right(jsonEncode(r.data));
      }
      return Left("Server exception:${r.statusCode}");
    } on DioError catch (e) {
      return Left(e.message.toString());
    }
  }


}