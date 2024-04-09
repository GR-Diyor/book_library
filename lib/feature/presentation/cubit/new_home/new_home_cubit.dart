
import 'dart:convert';

import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:book_library/feature/data/model/new_model/new_search_book.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/string.dart';
import '../../../../di_container.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/new_model/new_books.dart';
import '../../../data/model/support/new_empty.dart';
import '../../page/search_response.dart';
import 'new_home_state.dart';

class NewHomeCubit extends Cubit<NewHomeState>{
  NewHomeCubit():super(NewHomeInitState())  {
    emit(NewHomeLoadingState());
    connectivity.onConnectivityChanged.listen((result)  async {
      BooksList? cacheBooks = await LocalDatasourse().getData();
          var check = await connectivity.checkConnectivity();
      print(check.name);

      if(check!=ConnectivityResult.none&&booksList==null) {
        print("online");
        booksList = cacheBooks;
        getBookList();
      }else{
        print("offline");
        emit(NewHomeLoadedState());
        booksList = cacheBooks;
        emit(NewHomeLoadingState());
      }

    });
    emit(NewHomeLoadedState());
  }






  NewEmpty newEmpty = NewEmpty.instance;
  var DynamicResponse;
  NewSearchBook? newSearchBook;
  Connectivity connectivity = sl<Connectivity>();
  BooksList? booksList;
  bool isSearchLoading = false;
  Future<void> navigateSearch(BuildContext context,String? text) async {
    var check = await connectivity.checkConnectivity();
    if(check==ConnectivityResult.none) {
      'Tarmoq mavjud emas'.showSnackbar(context);
    }else {


      if (text != null && text.isNotEmpty && text.trim() != "") {
        FocusScope.of(context).unfocus();
        if(text.length<5){"Qidiruv so'zi 5 harfdan kam bo'lmasligi kerak!".showSnackbar(context);return;}
        getNewSearchBook(text.toString(),context);
      }
    }
  }

  void getNewSearchBook(String text, BuildContext context)async{
    emit(NewHomeLoadingState());
    isSearchLoading=true;
    try{
      Either<String, String> searchBookData =
      await CategoryBooksUseCase.callnewSearchBook(text: text);
      searchBookData.fold(
        //if left
              (l) => emit(NewHomeErrorState(l)),
          //if right
              (r) {
            DynamicResponse = jsonDecode(r);
            if (DynamicResponse != null &&
                DynamicResponse['count'] != newEmpty.count) {
              newSearchBook = newSearchBookFromJson(r);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchResponse(
                  newSearchBook: newSearchBook!,
                );
              }));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Qidiruvda kitob topilmadi!!!")));
            }
          });
    }catch(e){
      emit(NewHomeErrorState(e.toString()));
    }
    isSearchLoading=false;
    emit(NewHomeLoadedState());
  }


  void getBookList() async {
    emit(NewHomeLoadingState());
    try {
        Either<String, String> listData =
        await CategoryBooksUseCase.callnewBookList(AppString.newBookList);
        listData.fold(
          //if left
                (l) => emit(NewHomeErrorState(l)),
            //if right
                (r) {
                  booksList = booksListFromJson(r);
                  LocalDatasourse().writeData(booksList!);

                });
    } catch (e) {
      emit(NewHomeErrorState(e.toString()));
    }
    emit(NewHomeLoadedState());
  }

}