import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
@override
List<Object?> get props => [];
}

class HomeInitState extends HomeState{

}

class HomeLoadingState extends HomeState{
}

class HomeLoadedState extends HomeState{
}

class HomeErrorState extends HomeState{
  final String error;
  HomeErrorState(this.error);
}