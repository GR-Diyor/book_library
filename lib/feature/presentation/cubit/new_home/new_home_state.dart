import 'package:equatable/equatable.dart';

abstract class NewHomeState extends Equatable{
@override
List<Object?> get props => [];
}

class NewHomeInitState extends NewHomeState{


}

class NewHomeLoadingState extends NewHomeState{
}

class NewHomeLoadedState extends NewHomeState{

}

class NewHomeErrorState extends NewHomeState{
  final String error;
  NewHomeErrorState(this.error);
}