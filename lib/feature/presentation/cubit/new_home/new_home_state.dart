import 'package:equatable/equatable.dart';

abstract class NewHomeState extends Equatable{

}

class NewHomeInitState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class NewHomeLoadingState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewHomeLoadedState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewHomeErrorState extends NewHomeState{
  final String error;
  NewHomeErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}