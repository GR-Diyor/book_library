import 'package:equatable/equatable.dart';

abstract class ReadBookState extends Equatable{
  List<Object?> get props => [];
}

class ReadBookInitState extends ReadBookState{
  @override
  List<Object?> get props => super.props;

}

class ReadBookLoadingState extends ReadBookState{
  @override
  List<Object?> get props => super.props;
}

class ReadBookLoadedState extends ReadBookState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class ReadBookErrorState extends ReadBookState{
  final String error;
  ReadBookErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}