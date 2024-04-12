import 'package:book_library/feature/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';

class BookDetailBody extends StatelessWidget {
  final BookDetailCubit bookDetailCubit;
  final bool isSearchBook;
  const BookDetailBody(
      {required this.bookDetailCubit, required this.isSearchBook, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Text(
          AppString.detail,
          style: TextStyle(
              color: AppColor.light,
              fontFamily: AppString.latoRegular,
              fontSize: AppDimension.textSize(context).bodyMedium!.fontSize),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.light,
            )),
        actions: [
          GestureDetector(
            onTap: () async {},
            child: Icon(
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
            await launchUrl(Uri.parse(isSearchBook
                ? bookDetailCubit.searchBook.items[0].accessInfo.webReaderLink
                : bookDetailCubit.book.items[0].accessInfo.webReaderLink));
          },
          splashColor: Colors.grey,
          color: Colors.black,
          child: Text(
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
                decoration: BoxDecoration(
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
                        isSearchBook
                            ? bookDetailCubit
                                .searchBook.items[0].volumeInfo.title
                            : bookDetailCubit.book.items[0].volumeInfo.title,
                        style: TextStyle(
                            fontSize: 23,
                            color: AppColor.light,
                            fontFamily: AppString.latoRegular,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${AppString.by} ${isSearchBook ? bookDetailCubit.searchBook.items[0].volumeInfo.authors.first : bookDetailCubit.book.items[0].volumeInfo.authors.first}",
                        style: TextStyle(
                            fontFamily: AppString.latoRegular,
                            fontSize: 15,
                            color: Colors.grey[400]),
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
                                style: TextStyle(
                                    fontFamily: AppString.latoRegular,
                                    fontSize: 15,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.rating,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: AppString.latoRegular,
                                    color: AppColor.light),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                AppString.pages,
                                style: TextStyle(
                                    fontFamily: AppString.latoRegular,
                                    fontSize: 15,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.pagecount,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: AppString.latoRegular,
                                    color: AppColor.light),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                AppString.language,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppString.latoRegular,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.lang.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: AppString.latoRegular,
                                    color: AppColor.light),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                AppString.publishdate,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppString.latoRegular,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bookDetailCubit.pubdate.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: AppString.latoRegular,
                                    color: AppColor.light),
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
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              fontFamily: AppString.latoRegular,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            bookDetailCubit.desc,
                            style: TextStyle(
                                fontFamily: AppString.latoRegular,
                                color: Colors.grey[600],
                                fontSize: 15),
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
