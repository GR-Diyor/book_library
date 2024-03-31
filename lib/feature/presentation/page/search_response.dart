import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_cubit.dart';
import 'package:book_library/feature/presentation/cubit/search_response/search_response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/config/color.dart';
import '../../../core/config/string.dart';
import '../widget/error.dart';
import '../widget/loading.dart';

class SearchResponse extends StatefulWidget {
  final String text;
  const SearchResponse({required this.text,super.key});

  @override
  State<SearchResponse> createState() => _SearchResponseState();
}

class _SearchResponseState extends State<SearchResponse> {
 late SearchResponseCubit searchResponseCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResponseCubit = BlocProvider.of<SearchResponseCubit>(context);
    searchResponseCubit.getNewSearchBook(widget.text,context);
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

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
               SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: searchResponseCubit.newSearchBook.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: (Container(
                          padding: const EdgeInsets.all(10),
                          height: 270,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.background,
                              image:  DecorationImage(
                                  opacity: 0.4,
                                  image: AssetImage(AppString.overlay),
                                  fit: BoxFit.cover)),
                          child: Row(
                            children: [
                              Container(
                                height: 210,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            searchResponseCubit.newSearchBook.results[index].formats.imageJpeg??AppString.placeholder
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                               SizedBox(
                                width: 2.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Flexible(
                                    child: Text(
                                      // you can change it accordingly
                                      searchResponseCubit.newSearchBook.results[index].title.length>20?
                                      searchResponseCubit.newSearchBook.results[index].title.substring(0,20):
                                      searchResponseCubit.newSearchBook.results[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Flexible(
                                    child: Text(
                                      searchResponseCubit.newSearchBook.results[index].authors[0].name.length>20?
                                      searchResponseCubit.newSearchBook.results[index].authors[0].name.substring(0,20):
                                      searchResponseCubit.newSearchBook.results[index].authors[0].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "Download Count: ${
                                        searchResponseCubit.newSearchBook.results[index].downloadCount
                                        }",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(searchResponseCubit.newSearchBook.results[index].copyright

                                      ?"CopyRight"
                                        : "No CopyRight",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      searchResponseCubit.navigateReadBook(context, index);
                                    },
                                    color: AppColor.dark,
                                    child: Text(
                                      AppString.searchdetail,
                                      style: TextStyle(color: AppColor.light),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      );
                    }),
              )
            ],
          ),
        );
      }
    );
  }
}
