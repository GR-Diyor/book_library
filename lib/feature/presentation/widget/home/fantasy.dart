import 'package:book_library/core/config/dimension.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/string.dart';
import '../../../data/model/books.dart';
import '../../page/book_detail.dart';
import '../error.dart';

class Fantasy extends StatefulWidget {
  final Books fantasy;
  const Fantasy({required this.fantasy,super.key});

  @override
  State<Fantasy> createState() => _FantasyState();
}

class _FantasyState extends State<Fantasy> {
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      height: 270,
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
                        try {
                          return BookDetail(
                              id: widget.fantasy.items![index].volumeInfo!.industryIdentifiers!.first.identifier,IsSearchBook: false,);
                        } catch (e) {
                          return Errors(error: e.toString(),);
                        }
                      }));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 230,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(widget.fantasy.items!=null?widget.fantasy.items![index].volumeInfo!.imageLinks!.thumbnail:AppString.placeholder),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          widget.fantasy.items![index].volumeInfo!.title!.length>20?
                          widget.fantasy.items![index].volumeInfo!.title!.substring(0,20)
                              :
                          widget.fantasy.items![index].volumeInfo!.title!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    ));
  }
}
