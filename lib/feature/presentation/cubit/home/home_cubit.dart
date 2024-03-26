import 'package:book_library/feature/presentation/cubit/home/home_state.dart';
import 'package:book_library/feature/presentation/page/search_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitState());


  void navigateSearch(BuildContext context,String? text){
    if(text!=null&&text.isNotEmpty&&text.trim()!="") {
      FocusScope.of(context).unfocus();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return SearchResponse(text: text.toString());
          }));
    }
  }
}