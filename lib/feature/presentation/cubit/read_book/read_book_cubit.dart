import 'package:book_library/feature/presentation/cubit/read_book/read_book_state.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasourse/local/local_datasourse.dart';
import '../../widget/epub_widget.dart';

class ReadBookCubit extends Cubit<ReadBookState> {
  ReadBookCubit() : super(ReadBookInitState());
  late EpubController epubController;

  leadToPage(int id) async {
    emit(ReadBookLoadingState());
    EpubWidget.isLoading = true;
    List<Map<String, int>>? data = await LocalDatasourse.getSavePageIndex();
    Future.delayed(const Duration(milliseconds: 5000), () {
      for (var item in data) {
        if (int.parse(item.keys.first) == id) {
          EpubWidget.saveIndex = item.values.first;
        } else {
          EpubWidget.saveIndex = 0;
        }
      }
      epubController.scrollTo(
        index: EpubWidget.saveIndex,
        duration: const Duration(milliseconds: 300),
      );
      EpubWidget.isLoading = false;
      emit(ReadBookLoadedState());
    });
  }
}
