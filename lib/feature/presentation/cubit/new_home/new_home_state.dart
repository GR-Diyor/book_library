import 'package:equatable/equatable.dart';

abstract class NewHomeState extends Equatable{
@override
List<Object?> get props => [];
}

class NewHomeInitState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class NewHomeLoadingState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewHomeLoadedState extends NewHomeState{
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}

class NewHomeErrorState extends NewHomeState{
  final String error;
  NewHomeErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}