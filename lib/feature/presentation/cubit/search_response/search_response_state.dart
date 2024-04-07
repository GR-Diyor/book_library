import 'package:equatable/equatable.dart';

abstract class SearchResponseState extends Equatable{
@override
List<Object?> get props => [];
}

class SearchResponseInitState extends SearchResponseState{
  @override
  List<Object?> get props => super.props;

}

class SearchResponseLoading extends SearchResponseState{
  @override
  List<Object?> get props => super.props;

}

class SearchResponseLoaded extends SearchResponseState{
  @override
  List<Object?> get props => super.props;

}

class SearchResponseError extends SearchResponseState{
  final String error;
  SearchResponseError(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}