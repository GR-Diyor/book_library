
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_state.dart';
import 'package:book_library/feature/presentation/widget/bood_detail_body.dart';
import 'package:book_library/feature/presentation/widget/error.dart';
import 'package:book_library/feature/presentation/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetail extends StatefulWidget {
  final String id;
  final bool IsSearchBook;
  const BookDetail({required this.id,required this.IsSearchBook,super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {

  late BookDetailCubit bookDetailCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookDetailCubit = BlocProvider.of(context);
    bookDetailCubit.getBook(widget.id,context,IsSearchBook: widget.IsSearchBook);

  }




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailCubit,BookDetailState>(
      builder: (context,state) {
        if(state is BookDetailLoadingState){
          return const Loading();
        }
        if(state is BookDetailErrorState){
          return Errors(error: state.error);
        }
        return BookDetailBody(bookDetailCubit: bookDetailCubit,IsSearchBook:widget.IsSearchBook);
      }
    );
  }
}
