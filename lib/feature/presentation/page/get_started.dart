import 'package:book_library/feature/presentation/cubit/get_started/get_started_cubit.dart';
import 'package:book_library/feature/presentation/cubit/get_started/get_started_state.dart';
import 'package:book_library/feature/presentation/widget/error.dart';
import 'package:book_library/feature/presentation/widget/get_started_body.dart';
import 'package:book_library/feature/presentation/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  late GetStartedCubit getStartedCubit;


  @override
  void initState() {
    super.initState();
    getStartedCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetStartedCubit,GetStartedState>(
        builder: (context,state) {

          if(state is GetStartedLoadingState){
             return const Loading();
          }
          if(state is GetStartedLoadedState){
          }
          if(state is GetStartedErrorState){
            return Errors(error:state.error);
          }
          return GetStartedWidget(callback: () {
            getStartedCubit.getcategorydata(context);
          });
        }
    );
  }
}
