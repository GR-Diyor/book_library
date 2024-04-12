import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasourse/local/local_datasourse.dart';
import '../cubit/read_book/read_book_cubit.dart';
import '../cubit/read_book/read_book_state.dart';
import '../widget/epub_widget.dart';
import '../widget/error.dart';

class ReadBook extends StatefulWidget {
  final EpubController epubController;
  final int id;
  final String name;
  const ReadBook(
      {required this.epubController,
      required this.id,
      required this.name,
      super.key});

  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> with WidgetsBindingObserver {
  late ReadBookCubit readBookCubit;

  @override
  void initState() {
    super.initState();
    readBookCubit = BlocProvider.of(context);
    readBookCubit.epubController = widget.epubController;
    readBookCubit.leadToPage(widget.id);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    if (state == AppLifecycleState.hidden ||
        state == AppLifecycleState.paused) {
      WidgetsBinding.instance.addObserver(this);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    LocalDatasourse.setSavePageIndex(
        epubId: widget.id.toString(), savePageId: EpubWidget.saveIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBookCubit, ReadBookState>(builder: (context, state) {
      if (state is ReadBookErrorState) {
        return Errors(error: state.error);
      }

      return EpubWidget(
          epubController: readBookCubit.epubController,
          readBookCubit: readBookCubit,
          id: widget.id,
          name: widget.name);
    });
  }
}
