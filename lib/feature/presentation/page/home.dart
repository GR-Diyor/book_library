import 'package:book_library/feature/presentation/cubit/home/home_cubit.dart';
import 'package:book_library/feature/presentation/cubit/home/home_state.dart';
import 'package:book_library/feature/presentation/widget/home/home_body.dart';
import 'package:book_library/feature/presentation/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/books.dart';
import '../widget/error.dart';

class Home extends StatefulWidget {
  final Books thriller;
  final Books fantasy;
  final Books horror;
  final Books health;

  const Home({required this.thriller,
    required this.fantasy,
    required this.horror,
    required this.health,super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController t = TextEditingController();
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state) {

        if(state is HomeLoadingState){
          return const Loading();
        }
        if(state is HomeErrorState){
          return Errors(error: state.error);
        }

        return HomeBody(
          thriller: widget.thriller,
          fantasy: widget.fantasy,
          horror: widget.horror,
          health: widget.health,
          t: t,
          callback: () {
          homeCubit.navigateSearch(context, t.text);
        },);
      }
    );
  }
}