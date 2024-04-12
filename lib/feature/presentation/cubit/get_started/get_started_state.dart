import 'package:equatable/equatable.dart';

abstract class GetStartedState extends Equatable{
@override
List<Object?> get props => [];

}


class GetStartedInitState extends GetStartedState{

}

class GetStartedLoadingState extends GetStartedState{

}

class GetStartedLoadedState extends GetStartedState{

}

class GetStartedErrorState extends GetStartedState{

  GetStartedErrorState(this.error);
  final String error;

}