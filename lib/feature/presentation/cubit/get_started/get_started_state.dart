import 'package:equatable/equatable.dart';

abstract class GetStartedState extends Equatable{

}


class GetStartedInitState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class GetStartedLoadingState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetStartedLoadedState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetStartedErrorState extends GetStartedState{

  GetStartedErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}