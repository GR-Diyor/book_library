import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';

class BookDetailBody extends StatelessWidget {
  final BookDetailCubit bookDetailCubit;
  final bool IsSearchBook;
  const BookDetailBody({required this.bookDetailCubit,required this.IsSearchBook,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
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
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                var url = IsSearchBook?bookDetailCubit.searchBook.items[0].accessInfo.epub.isAvailable:bookDetailCubit.book.items[0].accessInfo.epub.isAvailable;
                if (url == true) {
                  bookDetailCubit.openfile(IsSearchBook?bookDetailCubit.searchBook.items[0].accessInfo.epub.acsTokenLink:
                  bookDetailCubit.book.items[0].volumeInfo.canonicalVolumeLink,"EpubBook");
                }
              } catch (e) {
                if (kDebugMode) {
                  print("Not available $e");
                }
              }
            },
            child:Icon(
              Icons.download_outlined,
              color: AppColor.transparent,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.background,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: MaterialButton(
          onPressed: () async {
            await launchUrl(
                Uri.parse(IsSearchBook?bookDetailCubit.searchBook.items[0].accessInfo.webReaderLink:bookDetailCubit.book.items[0].accessInfo.webReaderLink));
          },
          splashColor: Colors.grey,
          color: Colors.black,
          child:  Text(
            AppString.readbook,
            style: const TextStyle(color: Colors.white),
          ),
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
                      Container(
                        height: 23.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                bookDetailCubit.url,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        IsSearchBook?bookDetailCubit.searchBook.items[0].volumeInfo.title:bookDetailCubit.book.items[0].volumeInfo.title,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "by ${IsSearchBook?bookDetailCubit.searchBook.items[0].volumeInfo.authors.first:bookDetailCubit.book.items[0].volumeInfo.authors.first}"
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
                                AppString.reting,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[400])),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.rating,
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
                                AppString.pages,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[400])),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.pagecount,
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
                                bookDetailCubit.lang.toUpperCase(),
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
                                "Publish date",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[400])),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.pubdate.toUpperCase(),
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
                                AppString.whatit,
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
                                bookDetailCubit.desc,
                                style: GoogleFonts.lato(
                                    color: Colors.grey[600], fontSize: 15),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
