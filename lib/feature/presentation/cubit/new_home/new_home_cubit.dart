
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../page/search_response.dart';
import 'new_home_state.dart';

class NewHomeCubit extends Cubit<NewHomeState>{
  NewHomeCubit():super(NewHomeInitState());


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