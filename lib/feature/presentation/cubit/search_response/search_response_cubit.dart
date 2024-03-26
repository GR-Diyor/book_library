import 'dart:convert';

import 'package:book_library/feature/data/model/support/empty.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/search_book.dart';
import '../../page/book_detail.dart';

class SearchResponseCubit extends Cubit<SearchResponseState> {
  SearchResponseCubit() : super(SearchResponseInitState());

  late SearchBook searchBook;

  Empty empty = Empty.instance;
  var DynamicResponse;

  void getSearchBook(String text, BuildContext context) async {
    emit(SearchResponseLoading());
    try {
      Either<String, String> bookData =
          await CategoryBooksUseCase.callSearchBook(text: text);
      bookData.fold(
          //if left
          (l) => emit(SearchResponseError(l)),
          //if right
          (r) {
        DynamicResponse = jsonDecode(r);
        print(DynamicResponse);
        if (DynamicResponse != null &&
            DynamicResponse['totalItems'] != empty.totalItems) {
          searchBook = searchBookFromJson(r);
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Qidiruvda kitob topilmadi!!!")));
        }
      });
    } catch (e) {
      emit(SearchResponseError(e.toString()));
    }

    emit(SearchResponseLoaded());
  }

  void navigateDetailBook(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      print(searchBook
          .items[index].volumeInfo.industryIdentifiers!.first.identifier);
      return BookDetail(
        id: searchBook
            .items[index].volumeInfo.industryIdentifiers!.first.identifier,
        IsSearchBook: true,
      );
    }));
  }
}
