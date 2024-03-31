import 'package:equatable/equatable.dart';

abstract class ReadBookState extends Equatable{

}

class ReadBookInitState extends ReadBookState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ReadBookLoadingState extends ReadBookState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ReadBookLoadedState extends ReadBookState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ReadBookErrorState extends ReadBookState{
  final String error;
  ReadBookErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}