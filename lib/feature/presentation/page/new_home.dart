import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/new_home/new_home_cubit.dart';
import '../cubit/new_home/new_home_state.dart';
import '../widget/error.dart';
import '../widget/new_home_body.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with WidgetsBindingObserver{


  TextEditingController t = TextEditingController();
  late NewHomeCubit newHomeCubit;

  @override
  void initState() {
    super.initState();
    newHomeCubit = BlocProvider.of(context);
  }
@override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
  if(state == AppLifecycleState.inactive||state==AppLifecycleState.detached){
    WidgetsBinding.instance.addObserver(this);
  }
  if(state==AppLifecycleState.hidden||state == AppLifecycleState.paused){
    newHomeCubit.booksList = await LocalDatasourse().getData();
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
    return BlocBuilder<NewHomeCubit,NewHomeState>(
        builder: (context,state) {

          // if(state is NewHomeLoadingState){
          //   return const Loading();
          // }
          if(state is NewHomeErrorState){
            return Errors(error: state.error);
          }

          return NewHomeBody(
            t: t,
            callback: () {
              newHomeCubit.navigateSearch(context, t.text);
            },
            booksList:newHomeCubit.booksList,
          );
        }
    );
  }
}


