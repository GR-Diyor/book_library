import 'package:book_library/core/config/string.dart';
import 'package:flutter/material.dart';
import '../../../data/model/books.dart';
import '../../page/book_detail.dart';

class Adventure extends StatefulWidget {
  final Books adventure;
  const Adventure({required this.adventure,super.key});

  @override
  State<Adventure> createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            return BookDetail(
                             id: widget.adventure.items![index].volumeInfo!.industryIdentifiers!.first.identifier,
                              IsSearchBook: false,
                              );
                          }));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 230,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: const Offset(2, 2))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.adventure.items!=null?widget.adventure.items![index].volumeInfo!.imageLinks!.thumbnail:AppString.placeholder),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.adventure.items![index].volumeInfo!.title!.length>20?
                             widget.adventure.items![index].volumeInfo!.title!.substring(0,20)
                          :
                           widget.adventure.items![index].volumeInfo!.title!
                            ,
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

