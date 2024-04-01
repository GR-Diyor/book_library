import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:book_library/feature/presentation/page/read_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/config/color.dart';
import '../../../core/config/string.dart';
import 'book_tile.dart';

class NewHomeBody extends StatelessWidget {
  final BooksList booksList;
  final TextEditingController t;
  final VoidCallback callback;

  const NewHomeBody(
      {required this.callback,
      required this.t,
      required this.booksList,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.background,
      body: Column(
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
                        height: 4.h,
                        child: TextField(
                          controller: t,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: AppString.searchbook,
                              hintStyle: TextStyle(
                                  fontSize: AppDimension.textSize(context)
                                      .bodyMedium!
                                      .fontSize),
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40))),
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
                      child: Text(
                        AppString.search,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(AppString.explorethebook,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      AppString.findthelight,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: booksList.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookTile(
                            title: booksList.results[index].title.length > 20
                                ? booksList.results[index].title
                                    .substring(0, 20)
                                : booksList.results[index].title,
                            coverUrl: booksList.results[index].formats.imageJpeg.isNotEmpty
                                ? booksList.results[index].formats.imageJpeg
                                : AppString.placeholder,
                            author: booksList.results[index].authors[0].name,
                            download: booksList.results[index].downloadCount,
                            rating: booksList.results[index].downloadCount
                                .toString(),
                            copyRight: booksList.results[index].copyright,
                            ontap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return ReadBook(epubFile: booksList.results[index].formats.applicationEpubZip);
                                            }));
                            });
                      },
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
