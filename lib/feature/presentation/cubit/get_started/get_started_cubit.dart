import 'package:book_library/feature/presentation/cubit/get_started/get_started_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/string.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/books.dart';
import '../../../data/model/new_model/new_books.dart';
import '../../page/home.dart';
import '../../page/new_home.dart';

class GetStartedCubit extends Cubit<GetStartedState> {
  GetStartedCubit() : super(GetStartedInitState());

  void getcategorydata(BuildContext context) async {
    emit(GetStartedLoadingState());
    late Books books1;
    late Books books2;
    late Books books3;
    late Books books4;
    try {
      Either<String, String> thrillerdata =
          await CategoryBooksUseCase.callCategory(AppString.thrillerApi);
      thrillerdata.fold(
          //if left
          (l) => emit(GetStartedErrorState(l)),
          //if right
          (r) => books1 = booksFromJson(r));
      Either<String, String> fantasydata =
          await CategoryBooksUseCase.callCategory(AppString.fantasyApi);
      fantasydata.fold(
          //if left
          (l) => emit(GetStartedErrorState(l)),
          //if right
          (r) => books2 = booksFromJson(r));
      Either<String, String> horrordata =
          await CategoryBooksUseCase.callCategory(AppString.horrorApi);
      horrordata.fold(
          //if left
          (l) => emit(GetStartedErrorState(l)),
          //if right
          (r) => books3 = booksFromJson(r));
      Either<String, String> healthdata =
          await CategoryBooksUseCase.callCategory(AppString.healthApi);
      healthdata.fold(
          //if left
          (l) => emit(GetStartedErrorState(l)),
          //if right
          (r) => books4 = booksFromJson(r));
     // navigateHome(context, books1, books2, books3, books4);
    } catch (e) {
      emit(GetStartedErrorState(e.toString()));
    }
  }

  void navigateHome(BuildContext context, Books books1, Books books2,
      Books books3, Books books4) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home(thriller: books1, fantasy: books2, horror: books3, health: books4);
    }));
  }



  void getBookList(BuildContext context)async{

    late BooksList booksList;
    emit(GetStartedLoadingState());
    try{
      Either<String, String> listData =
      await CategoryBooksUseCase.callnewBookList(AppString.newBookList);
      listData.fold(
        //if left
              (l) => emit(GetStartedErrorState(l)),
          //if right
              (r) => booksList = booksListFromJson(r));
      navigateNewHome(context,booksList);
    }catch(e){
      emit(GetStartedErrorState(e.toString()));
    }
  }



  void navigateNewHome(BuildContext context,BooksList booksList) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return NewHome(booksList:booksList);
    }));
  }
}
