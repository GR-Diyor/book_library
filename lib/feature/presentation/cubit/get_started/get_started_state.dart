import 'package:equatable/equatable.dart';

abstract class GetStartedState extends Equatable{
@override
List<Object?> get props => [];
}


class GetStartedInitState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class GetStartedLoadingState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class GetStartedLoadedState extends GetStartedState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class GetStartedErrorState extends GetStartedState{

  GetStartedErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}