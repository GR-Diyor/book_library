import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/read_book/read_book_cubit.dart';
import '../cubit/read_book/read_book_state.dart';
import '../widget/epub_widget.dart';
import '../widget/error.dart';
import '../widget/loading.dart';

class ReadBook extends StatefulWidget {
  final String epubFile;
  const ReadBook({required this.epubFile,super.key});

  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {


  late ReadBookCubit readBookCubit;

  @override
  void initState() {
    super.initState();
    readBookCubit = BlocProvider.of(context);
    readBookCubit.loadEpub(widget.epubFile);
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
