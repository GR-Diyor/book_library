import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:book_library/feature/presentation/page/new_book_detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/config/color.dart';
import '../../../core/config/string.dart';
import 'book_tile.dart';
import 'loading_animation_widget.dart';

class NewHomeBody extends StatelessWidget {
  final bool isSearchLoading;
  final BooksList? booksList;
  final TextEditingController t;
  final VoidCallback callback;

  const NewHomeBody(
      {
        this.isSearchLoading=false,
        required this.callback,
      required this.t,
      required this.booksList,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppString.background_2,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: SizedBox(
                        height: 5.h,
                        child: Center(
                          child: TextField(
                            controller: t,
                            cursorColor: AppColor.background,
                            scribbleEnabled: false,
                            showCursor: true,
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            cursorWidth: 0.6,
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.zero,
                            maxLines: 1,
                            decoration: InputDecoration(
                              isDense: false,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: AppString.searchbook,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: AppDimension.textSize(context)
                                        .bodyMedium!
                                        .fontSize),
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minWidth: 30.w,
                      onPressed: callback,
                      splashColor: AppColor.light,
                      color: Colors.white,
                      child: !isSearchLoading?Text(
                        AppString.search,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ):const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive()),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(AppString.explorethebook,
                        style: TextStyle(
                                color: AppColor.light,
                                fontSize: 19,
                            fontFamily: AppString.latoRegular,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      AppString.findthelight,
                      style: TextStyle(
                              fontSize: 13,
                              color: AppColor.light,
                          fontFamily: AppString.latoRegular,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: booksList!=null?Container(
                color: AppColor.light,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                      itemCount: booksList?.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookTile(
                            title: booksList!.results[index].title.length > 20
                                ? booksList!.results[index].title
                                    .substring(0, 20)
                                : booksList!.results[index].title,
                            coverUrl:booksList!.results[index].formats!.imageJpeg,
                            author: booksList!.results[index].authors[0].name,
                            download: booksList!.results[index].downloadCount,
                            copyRight: booksList!.results[index].copyright,
                            id: booksList!.results[index].id,
                            ontap: () {
                              if(FocusScope.of(context).hasFocus){
                                 FocusScope.of(context).unfocus();
                              }else {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return NewBookDetail(
                                          book: booksList!.results[index]);
                                    }));
                              }
                            });

                      },
                    ))
                  ],
                ),
              ):
              Container(
                color: AppColor.light,
                child: Shimmer.fromColors(
                    baseColor: AppColor.cardColor.withOpacity(0.7),//Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: const LoadingAnimationWidget(),
                ),
              ),
          )
        ],
      ),
    );
  }
}



