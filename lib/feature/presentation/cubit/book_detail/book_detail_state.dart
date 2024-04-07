import 'package:equatable/equatable.dart';

abstract class BookDetailState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

 class BookDetailInitState extends BookDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

 }

 class BookDetailLoadingState extends BookDetailState{
   @override
   // TODO: implement props
   List<Object?> get props => super.props;
 }

 class BookDetailLoadedState extends BookDetailState{
   @override
   // TODO: implement props
   List<Object?> get props => super.props;
 }

  class BookDetailErrorState extends BookDetailState{
  final String error;
  BookDetailErrorState(this.error);
    @override
    // TODO: implement props
    List<Object?> get props => super.props;
  }