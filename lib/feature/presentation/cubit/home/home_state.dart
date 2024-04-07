import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
@override
List<Object?> get props => [];
}

class HomeInitState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class HomeLoadingState extends HomeState{
  @override
  List<Object?> get props => super.props;
}

class HomeLoadedState extends HomeState{
  @override
  List<Object?> get props => super.props;
}

class HomeErrorState extends HomeState{
  final String error;
  HomeErrorState(this.error);
  @override
  List<Object?> get props => super.props;
}