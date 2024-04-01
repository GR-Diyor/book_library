import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/new_home/new_home_cubit.dart';
import '../cubit/new_home/new_home_state.dart';
import '../widget/error.dart';
import '../widget/loading.dart';
import '../widget/new_home_body.dart';

class NewHome extends StatefulWidget {
  final BooksList booksList;
  const NewHome({required this.booksList,super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {


  TextEditingController t = TextEditingController();
  late NewHomeCubit newHomeCubit;

  @override
  void initState() {
    super.initState();
    newHomeCubit = BlocProvider.of(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHomeCubit,NewHomeState>(
        builder: (context,state) {

          if(state is NewHomeLoadingState){
            return const Loading();
          }
          if(state is NewHomeErrorState){
            return Errors(error: state.error);
          }

          return NewHomeBody(
            t: t,
            callback: () {
              newHomeCubit.navigateSearch(context, t.text);
            },
            booksList:widget.booksList,
          );
        }
    );
  }
}


