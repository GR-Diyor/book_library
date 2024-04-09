import 'dart:convert';
import 'dart:io' as i;

import 'package:book_library/core/config/string.dart';
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_state.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/book.dart';
import '../../../data/model/search_book.dart';
import '../../../data/model/support/empty.dart';

class BookDetailCubit extends Cubit<BookDetailState>{
  BookDetailCubit():super(BookDetailInitState());

  var pagecount = "Not available";
  var desc = "Not available";
  var pubdate = "Not available";
  var lang = "Not available";
  var rating = "Not available";
  var url ="https://www.bing.com/images/search?view=detailV2&ccid=vx9%2fIUj5&id=3B7650A146D55682645F765E60E786419299154C&thid=OIP.vx9_IUj50utS7cbaiRtoZAHaE8&mediaurl=https%3a%2f%2fst3.depositphotos.com%2f1186248%2f14351%2fi%2f950%2fdepositphotos_143511907-stock-photo-not-available-rubber-stamp.jpg&exph=682&expw=1023&q=not+available&simid=608054098357136066&FORM=IRPRST&ck=BADF0353AC59677CCFAA67227357E3CB&selectedIndex=1&ajaxhist=0&ajaxserp=0";
  late Book book;
  late SearchBook searchBook;

  Empty empty = Empty.instance;
  var DynamicResponse;


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
  void getBook(String id,BuildContext context,{required bool IsSearchBook}) async {

    emit(BookDetailLoadingState());
    try {
      Either<String, String> bookData =
      await CategoryBooksUseCase.callBookwithID(api:AppString.bookDetailApi,id:id);
      bookData.fold(
        //if left
              (l) => emit(BookDetailErrorState(l)),
          //if right
              (r){

                DynamicResponse = jsonDecode(r);
                if (DynamicResponse!=null&&DynamicResponse['totalItems'] != empty.totalItems) {
                  if(IsSearchBook){
                    searchBook = searchBookFromJson(r);
                    getSearchData(searchBook);
                  }else{
                    book = bookFromJson(r);
                    getdata(book);
                  }
                }else
                {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Qidiruvda kitob topilmadi!!!")));
                }


              });

    } catch (e) {
      emit(BookDetailErrorState(e.toString()));
    }

    emit(BookDetailLoadedState());
  }


}