import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{

}

class HomeInitState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class HomeLoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadedState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeErrorState extends HomeState{
  final String error;
  HomeErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}