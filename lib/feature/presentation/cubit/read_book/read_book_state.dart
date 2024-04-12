import 'package:equatable/equatable.dart';

abstract class ReadBookState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ReadBookInitState extends ReadBookState{

}

class ReadBookLoadingState extends ReadBookState{
}

class ReadBookLoadedState extends ReadBookState{
}

class ReadBookErrorState extends ReadBookState{
  final String error;
  ReadBookErrorState(this.error);
}