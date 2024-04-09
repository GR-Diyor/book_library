import 'package:book_library/feature/presentation/cubit/get_started/get_started_state.dart';
import 'package:book_library/feature/presentation/cubit/new_search_book_detail/new_search_book_detail_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/string.dart';
import '../../../business/usecase/category_books_usecase.dart';
import '../../../data/model/books.dart';
import '../../../data/model/new_model/new_search_book.dart';
import '../../page/home.dart';
import '../../page/new_home.dart';

class NewSearchDetailCubit extends Cubit<NewSearchBookDetailState> {
  NewSearchDetailCubit() : super(NewSearchBookInitState());
  late NewSearchResult newSearchResult;
}
