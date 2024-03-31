import 'package:book_library/feature/presentation/cubit/read_book/read_book_state.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_file/internet_file.dart';

class ReadBookCubit extends Cubit<ReadBookState>{
  ReadBookCubit():super(ReadBookInitState());
  late EpubController epubController;
void loadEpub(epubFile)async{
  emit(ReadBookLoadingState());
  epubController =  EpubController(
    // Load document
    document:  EpubDocument.openData(await InternetFile.get(epubFile)),
    // Set start point
    epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
  );
  emit(ReadBookLoadedState());
}

}