import 'package:equatable/equatable.dart';

abstract class BookDetailState extends Equatable{

}

 class BookDetailInitState extends BookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

 }

 class BookDetailLoadingState extends BookDetailState{
   @override
   // TODO: implement props
   List<Object?> get props => throw UnimplementedError();
 }

 class BookDetailLoadedState extends BookDetailState{
   @override
   // TODO: implement props
   List<Object?> get props => throw UnimplementedError();
 }

  class BookDetailErrorState extends BookDetailState{
  final String error;
  BookDetailErrorState(this.error);
    @override
    // TODO: implement props
    List<Object?> get props => throw UnimplementedError();
  }