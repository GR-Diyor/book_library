import 'dart:convert';
import 'package:book_library/core/config/string.dart';
import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/book.dart';
import '../../../data/model/search_book.dart';
import '../../../data/model/support/empty.dart';

class BookDetailCubit extends Cubit<BookDetailState>{
  BookDetailCubit():super(BookDetailInitState());

  var pagecount = AppString.notaviable;
  var desc = AppString.notaviable;
  var pubdate = AppString.notaviable;
  var lang = AppString.notaviable;
  var rating = AppString.notaviable;
  var url = AppString.placeholder;
  late Book book;
  late SearchBook searchBook;

  Empty empty = Empty.instance;
  dynamic dynamicResponse;


  void getdata(Book book)async {
      url = book.items[0].volumeInfo.imageLinks.thumbnail;
      lang = book.items[0].volumeInfo.language;
      pubdate = book.items[0].volumeInfo.publishedDate!;
      desc = book.items[0].volumeInfo.description;
      pagecount = book.items[0].volumeInfo.pageCount.toString();
      rating = book.items[0].volumeInfo.maturityRating;
  }
  void getSearchData(SearchBook book)async {
    url = book.items[0].volumeInfo.imageLinks.thumbnail;
    lang = book.items[0].volumeInfo.language.name;
    pubdate =book.items[0].volumeInfo.publishedDate.toString().substring(0,10);
    desc = book.items[0].volumeInfo.description;
    pagecount = book.items[0].volumeInfo.pageCount.toString();
    rating = book.items[0].volumeInfo.maturityRating.name;
  }
  void getBook(String id,BuildContext context,{required bool isSearchBook}) async {

    emit(BookDetailLoadingState());
    try {
      Either<String, String> bookData =
      await CategoryBooksUseCase.callBookwithID(api:AppString.bookDetailApi,id:id);
      bookData.fold(
        //if left
              (l) => emit(BookDetailErrorState(l)),
          //if right
              (r){

                dynamicResponse = jsonDecode(r);
                if (dynamicResponse!=null&&dynamicResponse['totalItems'] != empty.totalItems) {
                  if(isSearchBook){
                    searchBook = searchBookFromJson(r);
                    getSearchData(searchBook);
                  }else{
                    book = bookFromJson(r);
                    getdata(book);
                  }
                }else
                {
                  Navigator.pop(context);
                 AppString.notfinded.showSnackbar(context);
                }


              });

    } catch (e) {
      emit(BookDetailErrorState(e.toString()));
    }

    emit(BookDetailLoadedState());
  }


}