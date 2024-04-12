import 'package:flutter/material.dart';
import '../../../../core/config/string.dart';
import '../../../data/model/books.dart';
import '../../page/book_detail.dart';

class Romance extends StatefulWidget {
  final Books romance;

  const Romance({required this.romance,super.key});

  @override
  State<Romance> createState() => _RomanceState();
}

class _RomanceState extends State<Romance> {

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
                            id: widget.romance.items![index].volumeInfo!.industryIdentifiers!.first.identifier,
                          isSearchBook: false,
                        );
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
                                image: NetworkImage(widget.romance.items!=null?widget.romance.items![index].volumeInfo!.imageLinks!.thumbnail:AppString.placeholder),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.romance.items![index].volumeInfo!.title!.length>20?
                          widget.romance.items![index].volumeInfo!.title!.substring(0,20)
                              :
                          widget.romance.items![index].volumeInfo!.title!
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
