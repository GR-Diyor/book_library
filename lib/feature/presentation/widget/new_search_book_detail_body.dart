
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';
import '../cubit/new_search_book_detail/new_search_book_detail_cubit.dart';

class NewSearchBookDetailBody extends StatelessWidget {
  final NewSearchDetailCubit newSearchDetailCubit;
  const NewSearchBookDetailBody({required this.newSearchDetailCubit,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimension.width(context),
      decoration:  BoxDecoration(
          color: AppColor.background,
          image: DecorationImage(
              alignment: Alignment.topCenter,
              opacity: 0.4,
              image: AssetImage(AppString.overlay),
              fit: BoxFit.contain)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          title:  Text(
            AppString.detail,
            style: GoogleFonts.lato(
                textStyle:
                TextStyle(color: Colors.white, fontSize:AppDimension.textSize(context).bodyMedium!.fontSize)),
          ),
          centerTitle: true,
          leading:  GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios,color: AppColor.light,)),
        ),
        backgroundColor: AppColor.transparent,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: MaterialButton(
            onPressed: () async {
            },
            splashColor: Colors.grey,
            color: Colors.black,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.download_rounded,color: AppColor.light,)
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.4,
                          image: AssetImage(AppString.overlay),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: '${newSearchDetailCubit.newSearchResult.id+newSearchDetailCubit.newSearchResult.downloadCount}',
                          child: CachedNetworkImage(
                            height: 23.h,
                            width: 15.h,
                            imageUrl: newSearchDetailCubit.newSearchResult.formats!.imageJpeg??AppString.placeholder,
                            imageBuilder:(context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${newSearchDetailCubit.newSearchResult.title.length>20?newSearchDetailCubit.newSearchResult.title.substring(0,25):newSearchDetailCubit.newSearchResult.title}...",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Text(
                          "by ${newSearchDetailCubit.newSearchResult.authors[0].name.length>20?newSearchDetailCubit.newSearchResult.authors[0].name.substring(0,20):newSearchDetailCubit.newSearchResult.authors[0].name}"
                          ,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15, color: Colors.grey[400])),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Author",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400])),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.copyright?"copyright":"not copyright",
                                  style: GoogleFonts.lato(
                                      textStyle:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  AppString.downloadCount,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400])),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.downloadCount.toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Language",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400])),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.languages[0].name.toUpperCase(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "id",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400])),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.id.toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: AppColor.light)),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(color: AppColor.light),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 25),
                            child: ListView(
                              children: [
                                Text(
                                  AppString.subjects,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      )),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.subjects[0],
                                  style: GoogleFonts.lato(
                                      color: Colors.grey[600], fontSize: 15),
                                ),
                                newSearchDetailCubit.newSearchResult.subjects.length>1?Text(
                                  newSearchDetailCubit.newSearchResult.subjects[1],
                                  style: GoogleFonts.lato(
                                      color: Colors.grey[600], fontSize: 15),
                                ):const SizedBox.shrink(),
                                newSearchDetailCubit.newSearchResult.subjects.length>2?Text(
                                  newSearchDetailCubit.newSearchResult.subjects[2],
                                  style: GoogleFonts.lato(
                                      color: Colors.grey[600], fontSize: 15),
                                ):const SizedBox.shrink(),
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
