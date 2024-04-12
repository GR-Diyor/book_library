import 'package:book_library/feature/data/model/new_model/new_search_book.dart';
import 'package:book_library/feature/presentation/cubit/new_search_book_detail/new_search_book_detail_cubit.dart';
import 'package:book_library/feature/presentation/cubit/new_search_book_detail/new_search_book_detail_state.dart';
import 'package:book_library/feature/presentation/widget/new_search_book_detail_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/error.dart';

class NewSearchBookDetail extends StatefulWidget {
  final NewSearchResult newSearchResult;
  const NewSearchBookDetail({required this.newSearchResult,super.key});

  @override
  State<NewSearchBookDetail> createState() => _NewSearchBookDetailState();
}

class _NewSearchBookDetailState extends State<NewSearchBookDetail> with WidgetsBindingObserver{

  late NewSearchDetailCubit newSearchDetailCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newSearchDetailCubit = BlocProvider.of(context);
    newSearchDetailCubit.newSearchResult = widget.newSearchResult;
    newSearchDetailCubit.matchBook(widget.newSearchResult.id);
  }
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if(FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    if(state==AppLifecycleState.hidden||state == AppLifecycleState.paused){
      WidgetsBinding.instance.addObserver(this);
    }
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSearchDetailCubit,NewSearchBookDetailState>(
        builder: (context,state) {
          if(state is NewSearchBookErrorState){
            return Errors(error: state.error);
          }
          return NewSearchBookDetailBody(newSearchDetailCubit: newSearchDetailCubit,name: widget.newSearchResult.title,);
        }
    );
  }
}
