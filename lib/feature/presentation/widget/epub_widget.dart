import 'package:book_library/core/config/dimension.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

import '../../../core/config/color.dart';


class EpubWidget extends StatefulWidget {
  final EpubController epubController;
  const EpubWidget({required this.epubController,super.key});

  @override
  State<EpubWidget> createState() => _EpubWidgetState();
}

class _EpubWidgetState extends State<EpubWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading:GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: AppColor.light,)),
        // Show actual chapter name
        title: EpubViewActualChapter(
            controller: widget.epubController,
            builder: (chapterValue) => chapterValue?.chapter?.Title!=null?Text(
              chapterValue!.chapter!.Title!.length>30?'${(chapterValue.chapter?.Title?.replaceAll('\n', '').trim() ?? '').substring(0,30,)}...':chapterValue.chapter!.Title!,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: AppDimension.textSize(context).bodyLarge!.fontSize,color: AppColor.light,),
            ):Text("Awesome eBook",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: AppDimension.textSize(context).bodyLarge!.fontSize,color: AppColor.light,),
            )
        ),
      ),
      // Show table of contents
      endDrawer: Drawer(
        backgroundColor:AppColor.light,
        child: EpubViewTableOfContents(
          controller: widget.epubController,
        ),
      ),
      // Show epub document
      body: EpubView(
        controller: widget.epubController,
      ),
    );
  }
}