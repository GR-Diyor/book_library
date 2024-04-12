import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/data/model/new_model/new_search_book.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_cubit.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/color.dart';
import '../../../core/config/string.dart';
import '../widget/book_tile.dart';
import '../widget/error.dart';
import '../widget/loading.dart';

class SearchResponse extends StatefulWidget {
  final NewSearchBook newSearchBook;
  const SearchResponse({required this.newSearchBook,super.key});

  @override
  State<SearchResponse> createState() => _SearchResponseState();
}

class _SearchResponseState extends State<SearchResponse>with WidgetsBindingObserver {
 late SearchResponseCubit searchResponseCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResponseCubit = BlocProvider.of<SearchResponseCubit>(context);
    searchResponseCubit.newSearchBook = widget.newSearchBook;
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
    return BlocBuilder<SearchResponseCubit,SearchResponseState>(
      builder: (context,state) {
        if(state is SearchResponseLoading){
          return const Loading();
        }
        if(state is SearchResponseError){
          return Errors(error: state.error);
        }
        return Container(
          width: AppDimension.width(context),
          decoration:BoxDecoration(
              color: AppColor.background,
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.4,
                  image: AssetImage(AppString.overlay),
                  fit: BoxFit.contain)),
          child: Scaffold(
            backgroundColor: AppColor.light.withOpacity(0.6),
            appBar: AppBar(
              backgroundColor: AppColor.transparent,
              title:   Text(
                AppString.result,
                style:  TextStyle(
                    color: AppColor.dark,
                    fontWeight: FontWeight.bold,),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.dark,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: searchResponseCubit.newSearchBook.results.isNotEmpty?
                  ListView.builder(
                      itemCount: searchResponseCubit.newSearchBook.results.length,
                      itemBuilder: (context, index) {
                        return BookTile(
                            title: searchResponseCubit.newSearchBook.results[index].title.length>20?
                            searchResponseCubit.newSearchBook.results[index].title.substring(0,20):
                            searchResponseCubit.newSearchBook.results[index].title,
                            coverUrl:searchResponseCubit.newSearchBook.results[index].formats.imageJpeg!=null?searchResponseCubit.newSearchBook.results[index].formats.imageJpeg!:AppString.placeholder,
                            author: searchResponseCubit.newSearchBook.results[index].authors[0].name.length>20?
                            searchResponseCubit.newSearchBook.results[index].authors[0].name.substring(0,20):
                            searchResponseCubit.newSearchBook.results[index].authors[0].name,
                            download: searchResponseCubit.newSearchBook.results[index].downloadCount,
                            copyRight: searchResponseCubit.newSearchBook.results[index].copyright,
                            id: searchResponseCubit.newSearchBook.results[index].id,
                            ontap: () {
                                searchResponseCubit.navigateReadBook(context, index);
                            });
                      })
                  :
                  Center(child: Text(AppString.notfinded,
                  style: TextStyle(color: AppColor.dark,fontSize: AppDimension.textSize(context).bodyLarge!.fontSize),
                  ),),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
