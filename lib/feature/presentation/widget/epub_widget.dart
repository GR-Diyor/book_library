import 'package:book_library/core/config/dimension.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';


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
      appBar: AppBar(
        // Show actual chapter name
        title: EpubViewActualChapter(
            controller: widget.epubController,
            builder: (chapterValue) => Text(
              '${'Chapter: ${chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''}'.substring(0,30,)}...',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: AppDimension.textSize(context).bodyLarge!.fontSize),
            )
        ),
      ),
      // Show table of contents
      endDrawer: Drawer(
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