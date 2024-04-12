import 'package:equatable/equatable.dart';

abstract class SearchResponseState extends Equatable{
@override
List<Object?> get props => [];
}

class SearchResponseInitState extends SearchResponseState{

}

class SearchResponseLoading extends SearchResponseState{

}

class SearchResponseLoaded extends SearchResponseState{

}

class SearchResponseError extends SearchResponseState{
  final String error;
  SearchResponseError(this.error);

}