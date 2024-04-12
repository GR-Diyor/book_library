import 'dart:convert';
import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/model/new_model/new_search_book.dart';
import 'package:book_library/feature/data/model/support/empty.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/string.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/search_book.dart';
import '../../../data/model/support/new_empty.dart';
import '../../page/book_detail.dart';
import '../../page/new_search_book_detail.dart';

class SearchResponseCubit extends Cubit<SearchResponseState> {
  SearchResponseCubit() : super(SearchResponseInitState());

  late SearchBook searchBook;
  NewSearchBook newSearchBook = NewSearchBook.instance;

  Empty empty = Empty.instance;
  NewEmpty newEmpty = NewEmpty.instance;
  dynamic dynamicResponse;

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
        dynamicResponse = jsonDecode(r);
        if (dynamicResponse != null &&
            dynamicResponse['totalItems'] != empty.totalItems) {
          searchBook = searchBookFromJson(r);
        } else {
          Navigator.pop(context);
          AppString.notfinded.showSnackbar(context);
        }
      });
    } catch (e) {
      emit(SearchResponseError(e.toString()));
    }

    emit(SearchResponseLoaded());
  }

  void navigateDetailBook(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (kDebugMode) {
        print(searchBook
          .items[index].volumeInfo.industryIdentifiers!.first.identifier);
      }
      return BookDetail(
        id: searchBook
            .items[index].volumeInfo.industryIdentifiers!.first.identifier,
        isSearchBook: true,
      );
    }));
  }


  void navigateReadBook(BuildContext context, int index) {
    if (newSearchBook.results[index].formats.applicationEpubZip!=null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return NewSearchBookDetail(newSearchResult: newSearchBook.results[index]);
            }));
    } else {
      AppString.booknotdownload.showSnackbar(context);
    }

}

}
