import 'package:equatable/equatable.dart';

abstract class SearchResponseState extends Equatable{

}

class SearchResponseInitState extends SearchResponseState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SearchResponseLoading extends SearchResponseState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SearchResponseLoaded extends SearchResponseState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SearchResponseError extends SearchResponseState{
  final String error;
  SearchResponseError(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}