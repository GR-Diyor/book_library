import 'package:book_library/core/config/utill/dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';
import '../cubit/new_book_detail/new_book_detail_cubit.dart';

class NewBookDetailBody extends StatelessWidget {
  final NewBookDetailCubit newBookDetailCubit;
  final String name;
  const NewBookDetailBody({required this.newBookDetailCubit,required this.name,super.key});

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
            style:
                TextStyle(color: Colors.white,
                    fontFamily: AppString.latoRegular,
                    fontSize:AppDimension.textSize(context).bodyMedium!.fontSize),
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
          child: FilledButton(
            onPressed: () async {
              if(newBookDetailCubit.isDownloaded){
               newBookDetailCubit.navigateEpubView(context, newBookDetailCubit.newBook.id,name);
              }else {
                if (newBookDetailCubit.newBook.formats?.applicationEpubZip !=
                    null) {
                  newBookDetailCubit.loadEpub(context,
                      newBookDetailCubit.newBook.formats?.applicationEpubZip,
                  newBookDetailCubit.newBook.id
                  );
                } else {
                  AppString.booknotdownload.showSnackbar(context);
                }
              }
            },
             style: ButtonStyle(
               backgroundColor: MaterialStateColor.resolveWith((states) => AppColor.background),
               overlayColor:  MaterialStateColor.resolveWith((states) => AppColor.transparent)
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
                              errorWidget: (context, url, error) => Image(image: AssetImage(AppString.bookAvailable), fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${newBookDetailCubit.newBook.title.length>25?newBookDetailCubit.newBook.title.substring(0,25):newBookDetailCubit.newBook.title}...",
                            style:  TextStyle(
                                    fontSize: 23,
                                    color: AppColor.light,
                                fontFamily: AppString.latoRegular,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "${AppString.by} ${newBookDetailCubit.newBook.authors[0].name.length>20?newBookDetailCubit.newBook.authors[0].name.substring(0,20):newBookDetailCubit.newBook.authors[0].name}"
                          ,
                          style: TextStyle(
                              fontFamily: AppString.latoRegular,
                                  fontSize: 15, color: Colors.grey[400]),
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
                                  AppString.author,
                                  style:TextStyle(
                                          fontSize: 15,
                                      fontFamily: AppString.latoRegular,
                                          color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newBookDetailCubit.newBook.copyright?AppString.copyright:AppString.notcopyright,
                                  style:TextStyle(
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
                                  AppString.download,
                                  style: TextStyle(
                                          fontSize: 15,
                                      fontFamily: AppString.latoRegular,
                                          color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newBookDetailCubit.newBook.downloadCount.toString(),
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
                                  newBookDetailCubit.newBook.languages[0].name.toUpperCase(),
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
                                  AppString.id,
                                  style:TextStyle(
                                          fontSize: 15,
                                      fontFamily: AppString.latoRegular,
                                          color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newBookDetailCubit.newBook.id.toString(),
                                  style:TextStyle(
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
                                  AppString.subjects,
                                  style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                    fontFamily: AppString.latoRegular,
                                      ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  newBookDetailCubit.newBook.subjects[0],
                                  style: TextStyle(
                                      fontFamily: AppString.latoRegular,
                                      color: Colors.grey[600], fontSize: 15),
                                ),
                                newBookDetailCubit.newBook.subjects.length>1?Text(
                                  newBookDetailCubit.newBook.subjects[1],
                                  style: TextStyle(
                                      fontFamily: AppString.latoRegular,
                                      color: Colors.grey[600], fontSize: 15),
                                ):const SizedBox.shrink(),
                                newBookDetailCubit.newBook.subjects.length>2?Text(
                                  newBookDetailCubit.newBook.subjects[2],
                                  style:TextStyle(
                                      fontFamily: AppString.latoRegular,
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
