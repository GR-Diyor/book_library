import 'package:equatable/equatable.dart';

abstract class NewSearchBookDetailState extends Equatable{
  @override
  List<Object?> get props => [];
}

class NewSearchBookInitState extends NewSearchBookDetailState{

}

class NewSearchBookLoadingState extends NewSearchBookDetailState{
}

class NewSearchBookLoadedState extends NewSearchBookDetailState{
}

class NewSearchBookErrorState extends NewSearchBookDetailState{
  final String error;
  NewSearchBookErrorState(this.error);
}