import 'package:equatable/equatable.dart';

abstract class BookDetailState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

 class BookDetailInitState extends BookDetailState{

 }

 class BookDetailLoadingState extends BookDetailState{
 }

 class BookDetailLoadedState extends BookDetailState{
 }

  class BookDetailErrorState extends BookDetailState{
  final String error;
  BookDetailErrorState(this.error);
  }