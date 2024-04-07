import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/read_book/read_book_cubit.dart';
import '../cubit/read_book/read_book_state.dart';
import '../widget/epub_widget.dart';
import '../widget/error.dart';
import '../widget/loading.dart';

class ReadBook extends StatefulWidget {
  final EpubController epubController;
  const ReadBook({required this.epubController,super.key});

  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {


  late ReadBookCubit readBookCubit;

  @override
  void initState() {
    super.initState();
    readBookCubit = BlocProvider.of(context);
    readBookCubit.epubController = widget.epubController;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBookCubit,ReadBookState>(
        builder: (context,state) {

          if(state is ReadBookLoadingState){
            return const Loading();
          }
          if(state is ReadBookErrorState){
            return Errors(error: state.error);
          }

          return EpubWidget(epubController: readBookCubit.epubController,);
        }
    );
  }
}
