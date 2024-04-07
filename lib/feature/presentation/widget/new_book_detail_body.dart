import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/presentation/page/read_book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';
import '../cubit/new_book_detail/new_book_detail_cubit.dart';

class NewBookDetailBody extends StatelessWidget {
  final NewBookDetailCubit newBookDetailCubit;
  const NewBookDetailBody({required this.newBookDetailCubit,super.key});

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
      ),
      backgroundColor: AppColor.background,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: MaterialButton(
          onPressed: () async {
            if(newBookDetailCubit.isDownloaded){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ReadBook(epubController: newBookDetailCubit.epubController,)));
            }else {
              if (newBookDetailCubit.newBook.formats?.applicationEpubZip !=
                  null) {
                newBookDetailCubit.loadEpub(context,
                    newBookDetailCubit.newBook.formats?.applicationEpubZip,
                newBookDetailCubit.newBook.id
                );
              } else {
                "Bu kitobni yuklab bo'lmaydi".showSnackbar(context);
              }
            }
          },
          splashColor: Colors.grey,
          color: Colors.black,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: newBookDetailCubit.isDownLoading&&!newBookDetailCubit.isDownloaded?
          Icon(Icons.download_rounded,color: AppColor.light,): newBookDetailCubit.isDownloaded?Text("Open",style: TextStyle(color: AppColor.light),):Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: AppColor.light,),
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
                      Hero(
                        tag: '${newBookDetailCubit.newBook.id+newBookDetailCubit.newBook.downloadCount}',
                        child: CachedNetworkImage(
                          height: 23.h,
                          width: 15.h,
                          imageUrl: newBookDetailCubit.newBook.formats!.imageJpeg,
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
                          newBookDetailCubit.newBook.title,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Text(
                        "by ${newBookDetailCubit.newBook.authors[0]}"
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
                                newBookDetailCubit.newBook.copyright?"CopyRight":"not CopyRight",
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
                                newBookDetailCubit.newBook.downloadCount.toString(),
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
                                newBookDetailCubit.newBook.languages[0].name.toUpperCase(),
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
                                newBookDetailCubit.newBook.id.toString(),
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
                                newBookDetailCubit.newBook.subjects[0],
                                style: GoogleFonts.lato(
                                    color: Colors.grey[600], fontSize: 15),
                              ),
                              newBookDetailCubit.newBook.subjects.length>1?Text(
                                newBookDetailCubit.newBook.subjects[1],
                                style: GoogleFonts.lato(
                                    color: Colors.grey[600], fontSize: 15),
                              ):const SizedBox.shrink(),
                              newBookDetailCubit.newBook.subjects.length>2?Text(
                                newBookDetailCubit.newBook.subjects[2],
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
    );
  }
}
