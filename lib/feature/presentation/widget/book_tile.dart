import 'package:book_library/core/config/color.dart';
import 'package:book_library/core/config/dimension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/config/string.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;
  final int download;
  final bool copyRight;
  final int id;
  final VoidCallback ontap;

  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.download,
    required this.copyRight,
    required this.id,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 1.h),
      child: InkWell(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.only(left:1.w,right: 1.w),
          padding:  EdgeInsets.all(1.h),
          decoration: BoxDecoration(
            color: AppColor.cardColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
               // height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.cardColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    )
                  ],
                ),
                child: Hero(
                  tag: '${id+download}',
                  child: CachedNetworkImage(
                    height: 120,
                    width: 90,
                    imageUrl: coverUrl,
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
                    errorWidget: (context, url, error) => Image(image: AssetImage(AppString.bookAvailable), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      Text("${AppString.by} : $author",
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 5),
                      Text(
                        "${AppString.download}: $download",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                       SizedBox(height: 1.h),
                      Row(
                        children: [
                          copyRight?const Icon(Icons.star,color: Colors.yellow,size: 25,):const SizedBox.shrink(),
                          Text(
                            copyRight?AppString.copyright:AppString.notcopyright,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}