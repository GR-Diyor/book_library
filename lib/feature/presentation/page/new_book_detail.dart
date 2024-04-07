import 'package:book_library/feature/presentation/widget/error.dart';
import 'package:book_library/feature/presentation/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/new_model/new_books.dart';
import '../cubit/new_book_detail/new_book_detail_cubit.dart';
import '../cubit/new_book_detail/new_book_detail_state.dart';
import '../widget/new_book_detail_body.dart';

class NewBookDetail extends StatefulWidget {
  final NewBook book;
  const NewBookDetail({required this.book,super.key});

  @override
  State<NewBookDetail> createState() => _NewBookDetailState();
}

class _NewBookDetailState extends State<NewBookDetail> {

  late NewBookDetailCubit newBookDetailCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newBookDetailCubit = BlocProvider.of(context);
   newBookDetailCubit.newBook = widget.book;
   newBookDetailCubit.matchBook();
  }




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBookDetailCubit,NewBookDetailState>(
        builder: (context,state) {
          if(state is NewBookDetailErrorState){
            return Errors(error: state.error);
          }
          return NewBookDetailBody(newBookDetailCubit: newBookDetailCubit);
        }
    );
  }
}
