import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/feature/presentation/page/book_detail.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/string.dart';
import '../../../data/model/books.dart';


class Horror extends StatefulWidget {
 final Books horror;
  const Horror({required this.horror,super.key});
  @override
  State<Horror> createState() => _HorrorState();
}

class _HorrorState extends State<Horror> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BookDetail(
                            id: widget.horror.items![index].volumeInfo!.industryIdentifiers!.first.identifier,
                          isSearchBook: false,
                        );
                      }));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 23.h,
                          width: 15.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage( widget.horror.items!=null?widget.horror.items![index].volumeInfo!.imageLinks!.thumbnail:AppString.placeholder),
                                fit: BoxFit.cover),
                          ),
                        ),
                         SizedBox(
                          height: 1.h,
                        ),
                        Text(
                            widget.horror.items![index].volumeInfo!.title!.length>20?
                            widget.horror.items![index].volumeInfo!.title!.substring(0,20)
                                :
                            widget.horror.items![index].volumeInfo!.title!,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
