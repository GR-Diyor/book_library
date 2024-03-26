import 'package:dartz/dartz.dart';
import '../../data/datasourse/remote/remote_datasourse.dart';

class CategoryBooksUseCase{
  static Future<Either<String, String>> callCategory(String api){
    return RemoteDataSource().getCategory(api);
  }

  static Future<Either<String, String>> callBookwithID({required String api,required String id}){
    return RemoteDataSource().getBook(api:api,id:id);
  }

  static Future<Either<String, String>> callSearchBook({required String text}){
    return RemoteDataSource().getSearchBook(text:text);
  }
}