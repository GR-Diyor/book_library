
import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/string.dart';
import '../../../../di_container.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/new_model/new_books.dart';
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
  Connectivity connectivity = sl<Connectivity>();
  BooksList? booksList;
  void navigateSearch(BuildContext context,String? text){
    if(text!=null&&text.isNotEmpty&&text.trim()!="") {
      FocusScope.of(context).unfocus();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return SearchResponse(text: text.toString());
          }));
    }
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