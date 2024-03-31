import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/new_home/new_home_cubit.dart';
import '../cubit/new_home/new_home_state.dart';
import '../widget/error.dart';
import '../widget/loading.dart';
import '../widget/new_home_body.dart';

class NewHome extends StatefulWidget {
  final BooksList booksList;
  const NewHome({required this.booksList,super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {


  TextEditingController t = TextEditingController();
  late NewHomeCubit newHomeCubit;

  @override
  void initState() {
    super.initState();
    newHomeCubit = BlocProvider.of(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHomeCubit,NewHomeState>(
        builder: (context,state) {

          if(state is NewHomeLoadingState){
            return const Loading();
          }
          if(state is NewHomeErrorState){
            return Errors(error: state.error);
          }

          return NewHomeBody(
            t: t,
            callback: () {
              newHomeCubit.navigateSearch(context, t.text);
            },
            booksList:widget.booksList,
          );
        }
    );
  }
}


class BookTile extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;
  final int price;
  final String rating;
  final int totalRating;
  final VoidCallback ontap;

  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.price,
    required this.rating,
    required this.totalRating,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    coverUrl,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 4),
                      Text("By : $author",
                          style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(height: 5),
                      Text(
                        "Price : $price",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,size: 25,),
                          Text(
                            rating,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "($totalRating ratings)",
                            style: Theme.of(context).textTheme.labelMedium,
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