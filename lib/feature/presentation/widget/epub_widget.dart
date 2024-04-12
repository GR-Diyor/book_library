import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/presentation/cubit/read_book/read_book_cubit.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import '../../../core/config/color.dart';

class EpubWidget extends StatelessWidget {
  final EpubController epubController;
  final ReadBookCubit readBookCubit;
  final int id;
  final String name;
  static int saveIndex = 0;
  static bool isLoading = true;
  const EpubWidget(
      {required this.epubController,
      required this.readBookCubit,
      required this.id,
      required this.name,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.light,
            )),
        // Show actual chapter name
        title: Text(
          name.length > 25 ? '${name.substring(0, 25)}...' : name,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: AppDimension.textSize(context).bodyLarge!.fontSize,
            color: AppColor.light,
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: AppColor.light,
        child: EpubViewTableOfContents(
          controller: epubController,
        ),
      ),
      // Show epub document
      body: Stack(
        children: [
          EpubView(
            controller: epubController,
            onChapterChanged: (value) {
              saveIndex = value!.position.index;
            },
          ),
            isLoading? Container(
            alignment: Alignment.center,
            color: AppColor.dark.withOpacity(0.4),
            child: CircularProgressIndicator(
              backgroundColor: AppColor.background,
              color: AppColor.cardColor,
            )
             ):const SizedBox.shrink(),
        ],
      ),
    );
  }
}
