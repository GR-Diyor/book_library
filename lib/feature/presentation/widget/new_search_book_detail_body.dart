import 'package:book_library/core/config/utill/dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';
import '../../../core/config/string.dart';
import '../cubit/new_search_book_detail/new_search_book_detail_cubit.dart';

class NewSearchBookDetailBody extends StatelessWidget {
  final NewSearchDetailCubit newSearchDetailCubit;
  final String name;
  const NewSearchBookDetailBody({required this.newSearchDetailCubit,required this.name,super.key});

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
                TextStyle(color: AppColor.light,
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
              if(newSearchDetailCubit.isDownloaded){
                newSearchDetailCubit.navigateEpubView(context, newSearchDetailCubit.newSearchResult.id,name);
              }else {
                if (newSearchDetailCubit.newSearchResult.formats.applicationEpubZip !=
                    null) {
                  newSearchDetailCubit.loadEpub(context,
                      newSearchDetailCubit.newSearchResult.formats.applicationEpubZip,
                      newSearchDetailCubit.newSearchResult.id
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
            child: newSearchDetailCubit.isDownLoading&&!newSearchDetailCubit.isDownloaded?
            Icon(Icons.download_rounded,color: AppColor.light,): newSearchDetailCubit.isDownloaded?Text(AppString.open,style: TextStyle(color: AppColor.light),):Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: AppColor.light,),)
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
                            imageUrl: newSearchDetailCubit.newSearchResult.formats.imageJpeg!,
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
                            "${newSearchDetailCubit.newSearchResult.title.length>20?newSearchDetailCubit.newSearchResult.title.substring(0,25):newSearchDetailCubit.newSearchResult.title}...",
                            style:  TextStyle(
                                    fontSize: 23,
                                    color: AppColor.light,
                                fontFamily: AppString.latoRegular,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "${AppString.by} ${newSearchDetailCubit.newSearchResult.authors[0].name.length>20?newSearchDetailCubit.newSearchResult.authors[0].name.substring(0,20):newSearchDetailCubit.newSearchResult.authors[0].name}"
                          ,
                          style: TextStyle(
                                  fontSize: 15, color: Colors.grey[400],
                            fontFamily: AppString.latoRegular,),
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
                                  style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],fontFamily: AppString.latoRegular,),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.copyright?AppString.copyright:AppString.notcopyright,
                                  style:TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light,
                                    fontFamily: AppString.latoRegular,),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  AppString.download,
                                  style:  TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],
                                    fontFamily: AppString.latoRegular,),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.downloadCount.toString(),
                                  style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light,
                                    fontFamily: AppString.latoRegular,),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  AppString.language,
                                  style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],
                                    fontFamily: AppString.latoRegular,),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.languages[0].name.toUpperCase(),
                                  style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColor.light,
                                    fontFamily: AppString.latoRegular,),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  AppString.id,
                                  style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],
                                    fontFamily: AppString.latoRegular,),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  newSearchDetailCubit.newSearchResult.id.toString(),
                                  style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: AppColor.light,
                                    fontFamily: AppString.latoRegular,),
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
                                  style:TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                    fontFamily: AppString.latoRegular,
                                      ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                newSearchDetailCubit.newSearchResult.subjects.isNotEmpty?Text(
                                  newSearchDetailCubit.newSearchResult.subjects[0],
                                  style: TextStyle(
                                      fontFamily: AppString.latoRegular,
                                      color: Colors.grey[600], fontSize: 15),
                                ):const SizedBox.shrink(),
                                newSearchDetailCubit.newSearchResult.subjects.length>1?Text(
                                  newSearchDetailCubit.newSearchResult.subjects[1],
                                  style: TextStyle(
                                      fontFamily: AppString.latoRegular,
                                      color: Colors.grey[600], fontSize: 15),
                                ):const SizedBox.shrink(),
                                newSearchDetailCubit.newSearchResult.subjects.length>2?Text(
                                  newSearchDetailCubit.newSearchResult.subjects[2],
                                  style: TextStyle(
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
