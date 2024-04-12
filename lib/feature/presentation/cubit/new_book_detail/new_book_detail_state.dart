import 'package:equatable/equatable.dart';

abstract class NewBookDetailState extends Equatable{
@override
List<Object?> get props => [];
}

class NewBookDetailInitState extends NewBookDetailState{

}

class NewBookDetailLoadingState extends NewBookDetailState{
}

class NewBookDetailLoadedState extends NewBookDetailState{
}

class NewBookDetailErrorState extends NewBookDetailState{
  final String error;
  NewBookDetailErrorState(this.error);
}