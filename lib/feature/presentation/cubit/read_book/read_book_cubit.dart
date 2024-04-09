import 'package:book_library/feature/presentation/cubit/read_book/read_book_state.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ReadBookCubit extends Cubit<ReadBookState>{
  ReadBookCubit():super(ReadBookInitState());
  late EpubController epubController;

}