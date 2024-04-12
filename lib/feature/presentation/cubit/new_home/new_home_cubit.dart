import 'dart:convert';
import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:book_library/feature/data/model/new_model/new_search_book.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print(check.name);
      }
      booksList = cacheBooks;
      getBookList();
      if(check!=ConnectivityResult.none) {
        if (kDebugMode) {
          print("online");
        }

      }

    });
    emit(NewHomeLoadedState());
  }



  TextEditingController t = TextEditingController();



  NewEmpty newEmpty = NewEmpty.instance;
  dynamic dynamicResponse;
  NewSearchBook? newSearchBook;
  Connectivity connectivity = sl<Connectivity>();
  BooksList? booksList;
  bool isSearchLoading = false;
  Future<void> navigateSearch(BuildContext context,String? text) async {
    var check = await connectivity.checkConnectivity();
    if(check==ConnectivityResult.none) {
      AppString.notConnection.showSnackbar(context);
    }else {


      if (text != null && text.isNotEmpty && text.trim() != "") {
        FocusScope.of(context).unfocus();
        if(text.length<5){AppString.requiredfivesymbols.showSnackbar(context);return;}
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
            dynamicResponse = jsonDecode(r);
            if (dynamicResponse != null &&
                dynamicResponse['count'] != newEmpty.count) {
              NewSearchBook? parsingCheck;
              try {
                parsingCheck = newSearchBookFromJson(r);
              }catch(e){
                if(parsingCheck==null){
                  AppString.notfinded.showSnackbar(context);
                }
              }

              newSearchBook = newSearchBookFromJson(r);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchResponse(
                  newSearchBook: newSearchBook!,
                );
              }));
            } else {
            AppString.notfinded.showSnackbar(context);
            }
          });
    }catch(e){
      emit(NewHomeErrorState(e.toString()));
    }
    isSearchLoading=false;
    t.value = TextEditingValue.empty;
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